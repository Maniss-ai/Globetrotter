package com.globetrotter.repository;

import com.globetrotter.model.entity.AnswerPojo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AnswerRepository extends JpaRepository<AnswerPojo, Long> {
    @Query("SELECT a FROM AnswerPojo a WHERE a.destinationPojo.id = :destinationId")
    List<AnswerPojo> findAllByDestinationId(@Param("destinationId") Long destinationId);
//
//    @Query("SELECT a FROM AnswerPojo a WHERE a.id <> :correctAnswerId ORDER BY RAND() LIMIT :limit")
//    List<AnswerPojo> findRandomIncorrectAnswers(@Param("correctAnswerId") Long correctAnswerId, @Param("limit") int limit);

}
