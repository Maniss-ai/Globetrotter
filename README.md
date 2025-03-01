# Globetrotter
🧩 The Globetrotter Challenge – The Ultimate Travel Guessing Game!


# Globetrotter App

## Project Overview

Welcome to the Globetrotter App, the ultimate travel guessing game designed to test your knowledge of global destinations. In this interactive full-stack web application, users receive cryptic clues about various famous places worldwide and must guess which destination the clues refer to. Successful guesses unlock fun facts and trivia, enhancing the learning experience.

## Key Features

- **Cryptic Clues**: Each game presents one or two clues about a destination to guess.
- **Immediate Feedback**: Users receive animated feedback based on their guesses:
  - **Correct Answer**: Confetti animation and a fun fact.
  - **Incorrect Answer**: Sad face animation and a fun fact.
- **Score Tracking**: Tracks and displays the user's total score based on correct and incorrect answers.
- **Challenge a Friend**: Allows users to send a game link to friends to invite them to play, complete with dynamic invite images.
- **User Profiles**: Users can register and manage their profiles, tracking game history and scores.

## Technologies Used

- **Frontend**: HTML, CSS, and JavaScript - These core web technologies create the user interface, ensuring a responsive and interactive experience.
- **Backend**: Java Spring Boot - Chosen for its comprehensive infrastructure support for developing robust web applications.
- **Database**: MySQL - Utilized for its reliability and scalability in handling complex data requirements.
- **AI Integration**: Uses OpenAI to enrich the dataset with clues, trivia, and fun facts.

## POJOs Connection Overview

The application uses several POJOs to manage and store data:

- **UserPojo**: Represents users of the application. Each user can have multiple game sessions.
- **GameSessionPojo**: Stores information about individual gaming sessions. It is linked to a user and can have multiple challenges associated with it.
- **DestinationPojo**: Contains details about each destination, which includes a list of clues, fun facts, and trivia related to that destination.
- **CluePojo**: Linked to a specific destination. Used to store the clues that help users guess the destination.
- **FunFactPojo**: Also linked to a specific destination, it stores fun facts revealed after a guess.
- **TriviaPojo**: Stores trivia about a destination, similar to fun facts.
- **AnswerPojo**: Related to a specific destination, it stores possible answers to the clues provided.
- **ChallengePojo**: Manages challenges between users, linked to specific game sessions.

### Database Relationships

- **One-to-Many**: `UserPojo` to `GameSessionPojo`, `DestinationPojo` to `CluePojo`, `DestinationPojo` to `FunFactPojo`, and `DestinationPojo` to `TriviaPojo`.
- **Many-to-One**: `GameSessionPojo` to `UserPojo`, `CluePojo`, `FunFactPojo`, `TriviaPojo`, and `AnswerPojo` to `DestinationPojo`.


## Setup Instructions

### Prerequisites

- Java JDK 11+
- Spring Boot
- MySQL
- Git

### Cloning the Repository

First, clone the repository to your local machine:

```bash
git clone https://github.com/yourgithubusername/globetrotter.git
cd globetrotter
```

### Backend Setup

1. **Navigate to the backend directory**:
   ```bash
   cd backend
   ```
2. **Install dependencies**:
   ```bash
   mvn clean install
   ```
3. **Create the MySQL database** and import the schema:
   ```sql
   CREATE DATABASE globetrotter;
   USE globetrotter;
   -- Import backup.sql
   ```
4. **Configure application properties** to include your database credentials in `src/main/resources/application.properties`.

5. **Run the application**:
   ```bash
   mvn spring-boot:run
   ```

### Frontend Setup

1. **Navigate to the frontend directory**:
   ```bash
   cd ../frontend
   ```
2. **Open the HTML file in any web browser to run the application**.

## Deployment

Detailed instructions on how to deploy both the frontend and backend on platforms like Vercel, Netlify, and Railway.

## Contributions

Encourages users to contribute by providing guidelines on how to propose changes or add new features.
