package com.globetrotter.repository;

import com.globetrotter.model.entity.UserPojo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<UserPojo, Long> {
    Optional<UserPojo> findByUsername(String username);
}

