package com.globetrotter.controller;

import com.globetrotter.model.data.GameQuestionData;
import com.globetrotter.model.entity.GameSessionPojo;
import com.globetrotter.model.form.GameAnswerForm;
import com.globetrotter.service.GameService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/games")
public class GameController {
    private final GameService gameService;

    public GameController(GameService gameService) {
        this.gameService = gameService;
    }

    @GetMapping("/random-question")
    public ResponseEntity<GameQuestionData> getRandomQuestion() {
        GameQuestionData questionData = gameService.getRandomClueWithOptions();
        return ResponseEntity.ok(questionData);
    }

    @GetMapping("/next-clue")
    public ResponseEntity<GameQuestionData> getNextClue(@RequestParam Long destinationId, @RequestParam String currentClue) {
        GameQuestionData questionData = gameService.getNextClue(destinationId, currentClue);
        if (questionData == null) {
            return ResponseEntity.noContent().build(); // ✅ Return 204 if no more clues
        }
        return ResponseEntity.ok(questionData);
    }

    @PostMapping("/validate-answer")
    public ResponseEntity<Boolean> validateAnswer(@RequestBody GameAnswerForm form) {
        boolean isCorrect = gameService.validateAnswer(form.getAnswerId(), form.getSessionId());
        return ResponseEntity.ok(isCorrect);
    }

    @PostMapping("/start-session/{userId}")
    public ResponseEntity<GameSessionPojo> startSession(@PathVariable Long userId) {
        GameSessionPojo session = gameService.startNewSession(userId);
        return ResponseEntity.ok(session);
    }
}
