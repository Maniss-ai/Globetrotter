package com.globetrotter.service;

import com.globetrotter.model.entity.ChallengePojo;
import com.globetrotter.model.entity.GameSessionPojo;
import com.globetrotter.repository.ChallengeRepository;
import com.globetrotter.repository.GameSessionRepository;
import org.springframework.stereotype.Service;

import java.util.Optional;
import java.util.UUID;

@Service
public class ChallengeService {

    private final ChallengeRepository challengeRepository;
    private final GameSessionRepository gameSessionRepository;

    public ChallengeService(ChallengeRepository challengeRepository, GameSessionRepository gameSessionRepository) {
        this.challengeRepository = challengeRepository;
        this.gameSessionRepository = gameSessionRepository;
    }

    public ChallengePojo createChallenge(String challengerUsername, String invitedUsername, Long gameSessionId) {
        GameSessionPojo gameSessionPojo = gameSessionRepository.findById(gameSessionId)
                .orElseThrow(() -> new RuntimeException("Game session not found"));

        // Generate a unique invite link
        String inviteLink = "http://13.50.239.130:8080/index.html?invite=" + UUID.randomUUID();

        // Create a dynamic image URL (this could call a third-party service or generate an on‑screen graphic)
        String dynamicImageUrl = "http://13.50.239.130:8080/api/challenges/dynamic-image?user="
                + challengerUsername + "&score=" + gameSessionPojo.getCurrentScore();

        ChallengePojo challenge = new ChallengePojo();
        challenge.setChallengerUsername(challengerUsername);
        challenge.setInvitedUsername(invitedUsername);
        challenge.setInviteLink(inviteLink);
        challenge.setAccepted(false);
        challenge.setGameSessionPojo(gameSessionPojo);
        challenge.setDynamicImageUrl(dynamicImageUrl);

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
