package com.globetrotter.service;

import com.globetrotter.model.entity.ChallengePojo;
import com.globetrotter.model.entity.GameSessionPojo;
import com.globetrotter.repository.ChallengeRepository;
import com.globetrotter.repository.GameSessionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;
import java.util.UUID;

@Service
public class ChallengeService {

    @Autowired
    private ChallengeRepository challengeRepository;

    @Autowired
    private GameSessionRepository gameSessionRepository;

    public ChallengePojo createChallenge(String challengerUsername, String invitedUsername, Long gameSessionId) {
        GameSessionPojo gameSessionPojo = gameSessionRepository.findById(gameSessionId)
                .orElseThrow(() -> new RuntimeException("Game session not found"));

        String inviteLink = "http://localhost:8080/api/challenges/join/" + UUID.randomUUID().toString();

        ChallengePojo challenge = new ChallengePojo();
        challenge.setChallengerUsername(challengerUsername);
        challenge.setInvitedUsername(invitedUsername);
        challenge.setInviteLink(inviteLink);
        challenge.setAccepted(false);
        challenge.setGameSessionPojo(gameSessionPojo);

        return challengeRepository.save(challenge);
    }

    public Optional<ChallengePojo> getChallengeByInviteLink(String inviteLink) {
        return challengeRepository.findByInviteLink(inviteLink);
    }

    public ChallengePojo acceptChallenge(String inviteLink) {
        ChallengePojo challenge = challengeRepository.findByInviteLink(inviteLink)
                .orElseThrow(() -> new RuntimeException("Invalid Challenge Link"));

        challenge.setAccepted(true);
        return challengeRepository.save(challenge);
    }
}
