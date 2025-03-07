package com.globetrotter.model.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "challenges")
public class ChallengePojo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String challengerUsername;
    private String invitedUsername;
    private String inviteLink;
    private boolean accepted;

    // New field for the dynamic image URL used in sharing
    private String dynamicImageUrl;

    @ManyToOne
    @JoinColumn(name = "game_session_id")
    private GameSessionPojo gameSessionPojo;
}
