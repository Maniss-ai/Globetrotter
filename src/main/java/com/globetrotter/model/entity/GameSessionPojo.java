package com.globetrotter.model.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.Data;
import lombok.NoArgsConstructor;
import jakarta.persistence.*;

@Entity
@Table(name = "game_sessions")
@Data
@NoArgsConstructor
public class GameSessionPojo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    @JsonBackReference
    private UserPojo userPojo;

    private int currentScore;
    private int totalQuestions;
    private int correctAnswers;
}

