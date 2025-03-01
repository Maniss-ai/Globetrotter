package com.globetrotter.repository;

import com.globetrotter.model.entity.ChallengePojo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ChallengeRepository extends JpaRepository<ChallengePojo, Long> {
    Optional<ChallengePojo> findByInviteLink(String inviteLink);
}
