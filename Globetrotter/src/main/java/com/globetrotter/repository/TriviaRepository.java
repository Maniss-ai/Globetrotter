package com.globetrotter.repository;

import com.globetrotter.model.entity.DestinationPojo;
import com.globetrotter.model.entity.TriviaPojo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TriviaRepository extends JpaRepository<TriviaPojo, Long> {
    // ✅ Fetch all trivia questions for a specific destination
    List<TriviaPojo> findByDestinationPojo(DestinationPojo destination);
}

