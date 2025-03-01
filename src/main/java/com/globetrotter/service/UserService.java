package com.globetrotter.service;

import com.globetrotter.model.entity.GameSessionPojo;
import com.globetrotter.model.entity.UserPojo;
import com.globetrotter.repository.GameSessionRepository;
import com.globetrotter.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final GameSessionRepository gameSessionRepository;

    @Autowired
    public UserService(UserRepository userRepository, GameSessionRepository gameSessionRepository) {
        this.userRepository = userRepository;
        this.gameSessionRepository = gameSessionRepository;
    }

    @Transactional
    public GameSessionPojo registerOrGetSession(String username) {
        // ✅ Check if the user already exists
        Optional<UserPojo> existingUser = userRepository.findByUsername(username);

        UserPojo user;
        if (existingUser.isPresent()) {
            user = existingUser.get();
        } else {
            // ✅ Register new user
            user = new UserPojo();
            user.setUsername(username);
            user = userRepository.save(user);
        }

        // ✅ Check if user already has an active session
        Optional<GameSessionPojo> existingSession = gameSessionRepository.findByUserPojo(user);

        if (existingSession.isPresent()) {
            return existingSession.get();
        }

        // ✅ Create a new game session
        GameSessionPojo newSession = new GameSessionPojo();
        newSession.setUserPojo(user);
        newSession.setTotalQuestions(0);
        newSession.setCorrectAnswers(0);
        newSession.setCurrentScore(0);

        return gameSessionRepository.save(newSession);
    }
}
