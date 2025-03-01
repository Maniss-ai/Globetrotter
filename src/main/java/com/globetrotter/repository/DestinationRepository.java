package com.globetrotter.repository;

import com.globetrotter.model.entity.DestinationPojo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DestinationRepository extends JpaRepository<DestinationPojo, Long> {

    // ✅ Fetch 3 random cities excluding the correct answer
    @Query("SELECT d FROM DestinationPojo d WHERE d.id <> :correctDestinationId ORDER BY RAND() LIMIT :limit")
    List<DestinationPojo> findRandomIncorrectDestinations(@Param("correctDestinationId") Long correctDestinationId, @Param("limit") int limit);
}
