package com.globetrotter.service;

import com.globetrotter.model.data.GameQuestionData;
import com.globetrotter.model.data.OptionData;
import com.globetrotter.model.entity.*;
import com.globetrotter.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

@Service
public class GameService {
    private final GameSessionRepository gameSessionRepository;
    private final AnswerRepository answerRepository;
    private final UserRepository userRepository;
    private final ClueRepository clueRepository;

    @Autowired
    public GameService(GameSessionRepository gameSessionRepository,
                       AnswerRepository answerRepository, UserRepository userRepository, ClueRepository clueRepository) {
        this.gameSessionRepository = gameSessionRepository;
        this.answerRepository = answerRepository;
        this.userRepository = userRepository;
        this.clueRepository = clueRepository;
    }

    public GameQuestionData getRandomClueWithOptions() {
        List<CluePojo> allClues = clueRepository.findAll();
        if (allClues.isEmpty()) {
            throw new RuntimeException("No clues found in the database.");
        }

        Random random = new Random();
        CluePojo randomClue = allClues.get(random.nextInt(allClues.size()));

        DestinationPojo destination = randomClue.getDestinationPojo();

        // ✅ Fetch correct answer from the database
        List<AnswerPojo> answerPojoList = answerRepository.findAllByDestinationId(destination.getId());
        if (answerPojoList.isEmpty()) {
            throw new RuntimeException("answers not found for destination: " + destination.getCity());
        }

        // ✅ Convert answers into OptionData with actual IDs
        List<OptionData> options = answerPojoList.stream()
                .map(answer -> new OptionData(answer.getId(), answer.getText()))
                .collect(Collectors.toList());

        // ✅ Shuffle options
        Collections.shuffle(options);

        // ✅ Find total clues for this destination
        int totalClues = clueRepository.findByDestinationPojoId(destination.getId()).size();

        return new GameQuestionData(destination.getId(), randomClue.getClueText(), options, totalClues);
    }


    public GameQuestionData getNextClue(Long destinationId, String currentClue) {
        // ✅ Fetch all clues for the given destination
        List<CluePojo> clues = clueRepository.findByDestinationPojoId(destinationId);

        if (clues.isEmpty()) {
            throw new RuntimeException("No clues found for this destination.");
        }

        // ✅ Find the index of the current clue
        int currentIndex = -1;
        for (int i = 0; i < clues.size(); i++) {
            if (clues.get(i).getClueText().equals(currentClue)) {
                currentIndex = i;
                break;
            }
        }

        // ✅ Get the next clue (loop back if at the last clue)
        CluePojo nextClue;
        if (currentIndex == -1 || currentIndex == clues.size() - 1) {
            nextClue = clues.get(0); // Restart from first clue if last reached
        } else {
            nextClue = clues.get(currentIndex + 1);
        }

        return new GameQuestionData(destinationId, nextClue.getClueText(), null, clues.size()); // Keep options unchanged
    }

    @Transactional
    public boolean validateAnswer(Long answerId, Long sessionId) {
        if (answerId == null) {
            throw new IllegalArgumentException("Answer ID cannot be null");
        }
        if (sessionId == null) {
            throw new IllegalArgumentException("Session ID cannot be null");
        }

        AnswerPojo answerPojo = answerRepository.findById(answerId)
                .orElseThrow(() -> new IllegalStateException("Answer not found with id: " + answerId));

        // ✅ Ensure session exists or create a new one
        GameSessionPojo session = gameSessionRepository.findById(sessionId)
                .orElseGet(() -> {
                    System.out.println("⚠️ Session ID not found. Creating a new session...");
                    GameSessionPojo newSession = new GameSessionPojo();
                    newSession.setTotalQuestions(0);
                    newSession.setCurrentScore(0);
                    newSession.setCorrectAnswers(0);
                    return gameSessionRepository.save(newSession);
                });

        // ✅ Update session stats
        session.setTotalQuestions(session.getTotalQuestions() + 1);
        if (answerPojo.isCorrect()) {
            session.setCurrentScore(session.getCurrentScore() + 1);
            session.setCorrectAnswers(session.getCorrectAnswers() + 1);
        }

        gameSessionRepository.save(session);
        return answerPojo.isCorrect();
    }

    public GameSessionPojo startNewSession(Long userId) {
        UserPojo userPojo = userRepository.findById(userId)
                .orElseThrow(() -> new IllegalStateException("User not found with id: " + userId));
        GameSessionPojo newSession = new GameSessionPojo();
        newSession.setUserPojo(userPojo);
        return gameSessionRepository.save(newSession);
    }
}
