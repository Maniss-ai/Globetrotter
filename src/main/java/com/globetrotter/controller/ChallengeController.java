package com.globetrotter.controller;

import com.globetrotter.model.entity.ChallengePojo;
import com.globetrotter.service.ChallengeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/api/challenges")
public class ChallengeController {

    @Autowired
    private ChallengeService challengeService;

    @PostMapping("/create")
    public ChallengePojo createChallenge(@RequestParam String challengerUsername,
                                         @RequestParam String invitedUsername,
                                         @RequestParam Long gameSessionId) {
        return challengeService.createChallenge(challengerUsername, invitedUsername, gameSessionId);
    }

    @GetMapping("/join/{inviteLink}")
    public Optional<ChallengePojo> getChallenge(@PathVariable String inviteLink) {
        return challengeService.getChallengeByInviteLink(inviteLink);
    }

    @PostMapping("/accept/{inviteLink}")
    public ChallengePojo acceptChallenge(@PathVariable String inviteLink) {
        return challengeService.acceptChallenge(inviteLink);
    }
}
