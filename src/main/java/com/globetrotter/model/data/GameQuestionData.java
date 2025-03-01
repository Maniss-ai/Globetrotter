package com.globetrotter.model.data;

import lombok.Getter;
import lombok.Setter;
import java.util.List;

@Getter
@Setter
public class GameQuestionData {
    private Long destinationId;
    private String clue;
    private List<OptionData> options;
    private int totalClues;

    public GameQuestionData(Long destinationId, String clue, List<OptionData> options, int totalClues) {
        this.destinationId = destinationId;
        this.clue = clue;
        this.options = options;
        this.totalClues = totalClues;
    }
}