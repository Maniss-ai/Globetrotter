# Globetrotter
🧩 The Globetrotter Challenge – The Ultimate Travel Guessing Game!

# Globetrotter App

Welcome to the Globetrotter App, the ultimate travel guessing game! This full-stack web application challenges users to guess destinations based on cryptic clues. Upon guessing, users unlock fun facts and trivia about the place. Ready to put your travel knowledge to the test?

## Features

- **Guess the Destination**: Users receive 1-2 clues about a famous place and guess the correct destination.
- **Immediate Feedback**: Depending on the guess, users see animated feedback:
  - **Correct Answer**: Confetti animation and a fun fact about the destination.
  - **Incorrect Answer**: A sad-face animation and a fun fact.
- **Score Tracking**: The app tracks the total number of correct and incorrect answers, displaying the total score.
- **Challenge a Friend**: Users can invite friends to play by sending a dynamic invite link via WhatsApp.
- **User Profiles**: Users can create and manage their profiles, tracking their game history and scores.

## Technologies Used

- **Backend**: Java Spring Boot
- **Frontend**: React (considered for engaging and interactive UI)
- **Database**: MySQL
- **Additional Tools**:
  - **AI Integration**: Utilizing OpenAI for expanding the dataset.
  - **Deployment**: Vercel or Netlify for hosting the frontend and Railway for the backend.

## Project Setup

### Prerequisites

- Java JDK 11 or newer
- Node.js and npm (for React frontend)
- MySQL Server

### Backend Setup

1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourgithubusername/globetrotter.git
   ```
2. **Navigate to the backend directory** and install dependencies:
   ```bash
   cd backend
   mvn install
   ```
3. **Set up the MySQL database**:
   - Create a new database named `globetrotter`
   - Import the initial schema from the provided SQL file.

4. **Configure application properties**:
   - Update `application.properties` with your database credentials and other configurations.

5. **Run the application**:
   ```bash
   mvn spring-boot:run
   ```

### Frontend Setup

1. **Navigate to the frontend directory** and install dependencies:
   ```bash
   cd ../frontend
   npm install
   ```
2. **Start the development server**:
   ```bash
   npm start
   ```
   This will launch the app at `http://localhost:3000`.

## Architecture Overview

This section includes a basic diagram and explanation of the app's architecture, detailing how the frontend interacts with the backend and the database.

![Architecture Diagram](link-to-your-diagram.png)

## API Documentation

Refer to the `API.md` for detailed documentation on backend endpoints, including request formats and example responses.

## Deployment

Instructions for deploying the app to Vercel/Netlify for the frontend and Railway for the backend.
