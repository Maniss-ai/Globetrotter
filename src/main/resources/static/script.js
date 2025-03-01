let sessionId = null;
let username = null;
let currentQuestion = null;
let clueIndex = 0;
let totalClues = 2;
let funFacts = [];
let funFactIndex = 0;
let incorrectAttempts = 0;

// User Registration & Fetch Previous Score
document.getElementById('registerUser').addEventListener('click', function () {
    username = document.getElementById('usernameInput').value.trim();
    if (!username) {
        alert("Please enter your name to start!");
        return;
    }

    fetch(`http://13.50.239.130:8080/api/users/register?username=${username}`, {
        method: "POST"
    })
        .then(response => response.json())
        .then(data => {
            sessionId = data.id;
            console.log("Game session started. Session ID:", sessionId);
            document.getElementById('score').innerText = data.currentScore;
            document.getElementById('questionsAttempted').innerText = data.totalQuestions;
            document.getElementById('registrationScreen').style.display = 'none';
            document.getElementById('gameScreen').style.display = 'flex';
            fetchClue();
        })
        .catch(error => console.error("Error registering user:", error));
});

// Fetch a new clue
function fetchClue() {
    document.getElementById('clueText').innerText = 'Loading...';
    document.getElementById('clueCounter').innerText = 'Loading...';
    fetch('http://13.50.239.130:8080/api/games/random-question')
        .then(response => response.json())
        .then(data => {
            document.getElementById('clueText').innerText = data.clue || 'No clues available!';
            displayOptions(data.options);
            currentQuestion = {
                destinationId: data.destinationId,
                currentClue: data.clue
            };
            clueIndex = 1;
            totalClues = data.totalClues || 2;
            updateClueCounter();
            incorrectAttempts = 0;
        })
        .catch(error => console.error('Error fetching random question:', error));
}

// Update Clue Counter
function updateClueCounter() {
    document.getElementById('clueCounter').innerText = `Clue ${clueIndex} of ${totalClues}`;
    const nextClueBtn = document.getElementById('nextClue');
    nextClueBtn.innerText = clueIndex >= totalClues ? "No More Clues" : "Next Clue";
    nextClueBtn.disabled = clueIndex >= totalClues;
}

// Display Answer Options
function displayOptions(options) {
    const container = document.getElementById('optionsContainer');
    container.innerHTML = '';
    options.forEach(option => {
        const button = document.createElement('button');
        button.textContent = option.text;
        button.classList.add('option-btn');
        button.onclick = () => validateAnswer(option.id, option.text, button);
        container.appendChild(button);
    });
}

// Validate Answer
function validateAnswer(answerId, answerText, button) {
    if (!answerId || !sessionId) {
        console.error("Error: No active session or answer ID is null.");
        return;
    }

    const requestData = {
        answerId: answerId,
        sessionId: sessionId,
        answerText: answerText
    };

    fetch(`http://13.50.239.130:8080/api/games/validate-answer`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(requestData)
    })
        .then(response => response.json())
        .then(isCorrect => {
            showFeedback(button, isCorrect);
            updateScore(isCorrect);
            if (isCorrect) {
                // Fetch fun facts when answer is correct
                fetchFunFacts(currentQuestion.destinationId, true);
            } else {
                incorrectAttempts++;
                if (incorrectAttempts === 1 && clueIndex < totalClues) {
                    fetchNextClue();
                } else if (incorrectAttempts === 2) {
                    // Show fun fact even for incorrect answer after max attempts
                    fetchFunFacts(currentQuestion.destinationId);
                }
            }
        })
        .catch(error => console.error("Error validating answer:", error));
}
function fetchNextClue() {
    fetch(`http://13.50.239.130:8080/api/games/next-clue?destinationId=${currentQuestion.destinationId}&currentClue=${encodeURIComponent(currentQuestion.currentClue)}`)
        .then(response => response.json())
        .then(data => {
            document.getElementById('clueText').innerText = data.clue;
            currentQuestion.currentClue = data.clue;
            clueIndex++;
            updateClueCounter();
        })
        .catch(error => console.error('Error fetching next clue:', error));
}
// Show Feedback (Correct/Incorrect)
function showFeedback(button, isCorrect) {
    const feedbackBox = document.createElement('div');
    feedbackBox.classList.add('feedback-box');
    feedbackBox.innerText = isCorrect ? "Correct" : "Incorrect";
    button.appendChild(feedbackBox);
    setTimeout(() => button.removeChild(feedbackBox), 2000);
}

// Update Score
function updateScore(isCorrect) {
    const scoreEl = document.getElementById('score');
    const questionsAttemptedEl = document.getElementById('questionsAttempted');
    let currentScore = parseInt(scoreEl.innerText);
    let questionsAttempted = parseInt(questionsAttemptedEl.innerText);

    scoreEl.innerText = isCorrect ? currentScore + 1 : currentScore;
    questionsAttemptedEl.innerText = questionsAttempted + 1;
}

// Fetch Next Clue
document.getElementById('nextClue').addEventListener('click', function () {
    if (!currentQuestion || !currentQuestion.destinationId) {
        console.error("Error: No current question data found.");
        return;
    }

    fetch(`http://13.50.239.130:8080/api/games/next-clue?destinationId=${currentQuestion.destinationId}&currentClue=${encodeURIComponent(currentQuestion.currentClue)}`)
        .then(response => {
            if (response.status === 204) { // No more clues, move to next question
                console.log("No more clues. Moving to next question.");
                alert("No more clues available! Moving to the next question.");
                fetchClue(); // Load a new question
                return null;
            }
            return response.json();
        })
        .then(data => {
            if (data && data.clue) {
                document.getElementById('clueText').innerText = data.clue;
                currentQuestion.currentClue = data.clue;
                clueIndex++;
                updateClueCounter();
            }
        })
        .catch(error => console.error('Error fetching next clue:', error));
});

// Fetch Fun Facts
function fetchFunFacts(destinationId, isCorrect = false) {
    fetch(`http://13.50.239.130:8080/api/destinations/${destinationId}/fun-facts`)
        .then(response => response.json())
        .then(data => {
            funFacts = data;
            funFactIndex = 0;
            showFunFact(isCorrect);
        })
        .catch(error => console.error("Error fetching fun facts:", error));
}

// Show Fun Fact Popup
function showFunFact(isCorrect) {
    document.getElementById('funFactHeader').innerText = isCorrect ?
        "🎉 Congratulations!" : "😢 Keep Learning!";
    document.getElementById('funFactText').innerText =
        funFacts[funFactIndex] || "No fun facts available!";
    document.getElementById('funFactModal').style.display = 'block';
}

// Show Next Fun Fact
function showNextFunFact() {
    if (funFacts.length === 0) {
        console.error("No fun facts available.");
        return;
    }

    funFactIndex = (funFactIndex + 1) % funFacts.length;
    document.getElementById('funFactText').innerText =
        funFacts[funFactIndex] || "No fun facts available!";
}

// Close Fun Fact Modal
document.getElementById('closeFunFact').addEventListener('click', function () {
    document.getElementById('funFactModal').style.display = 'none';
    fetchClue();
});

document.getElementById('nextFunFact').addEventListener('click', function () {
    showNextFunFact();
});
window.onload = () => {
    const urlParams = new URLSearchParams(window.location.search);
    const inviteLink = urlParams.get('invite');

    if (inviteLink) {
        fetch(`http://13.50.239.130:8080/api/challenges/join/${inviteLink}`)
            .then(response => response.json())
            .then(data => {
                if (data.accepted) {
                    alert("This challenge has already been accepted.");
                } else {
                    alert(`You're joining a challenge from ${data.challengerUsername}!`);
                    fetch(`http://13.50.239.130:8080/api/challenges/accept/${inviteLink}`, { method: "POST" });
                }
            })
            .catch(error => console.error("Error joining challenge:", error));
    }
};
const shareOnWhatsApp = (inviteLink) => {
    let shareText = `Join me in the Globetrotter Challenge! Click the link to play: ${inviteLink}`;
    let whatsappUrl = `https://api.whatsapp.com/send?text=${encodeURIComponent(shareText)}`;
    window.open(whatsappUrl, '_blank');
};

document.getElementById('shareOnWhatsApp').addEventListener('click', () => {
    fetch(`http://13.50.239.130:8080/api/challenges/create?challengerUsername=${username}&invitedUsername=Friend&gameSessionId=${sessionId}`, {
        method: "POST"
    })
        .then(response => response.json())
        .then(data => {
            shareOnWhatsApp(data.inviteLink);
        })
        .catch(error => console.error("Error sharing challenge:", error));
});
