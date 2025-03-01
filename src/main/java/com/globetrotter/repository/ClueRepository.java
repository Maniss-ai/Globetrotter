package com.globetrotter.repository;

import com.globetrotter.model.entity.CluePojo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ClueRepository extends JpaRepository<CluePojo, Long> {
    List<CluePojo> findByDestinationPojoId(Long destinationId);
}

