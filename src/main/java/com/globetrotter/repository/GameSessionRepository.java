package com.globetrotter.repository;

import com.globetrotter.model.entity.GameSessionPojo;
import com.globetrotter.model.entity.UserPojo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface GameSessionRepository extends JpaRepository<GameSessionPojo, Long> {
    Optional<GameSessionPojo> findByUserPojo(UserPojo userPojo);
}

