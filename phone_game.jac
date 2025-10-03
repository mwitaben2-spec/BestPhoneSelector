"""The Best Phone Selection Game"""

import random;


obj Game {
    has attempts: int, won: bool = False;

    def play {
        raise NotImplementedError("Subclasses must implement this method.");
    }
}


obj BestPhoneSelectionGame (Game) {
    has attempts: int = 3, best_phone: str = random.choice(["i-phone", "Samsung"]);

    def play {
        while self.attempts > 0 {
            guess = input("Which phone do you think is the best? (i-phone/Samsung): ");
            if guess.lower() in ["i-phone", "samsung"] {
                self.process_guess(guess);
                if self.won {
                    break;
                }
            } else {
                print("That's not a valid choice! Please enter i-phone or Samsung.");
            }
        }
        if not self.won {
            print(f"Sorry, you're out of attempts. The best phone was {self.best_phone}.");
        }
    }

    def process_guess(guess: str) {
        if guess.lower() == self.best_phone.lower() {
            print(f"🎉 Congratulations! You guessed correctly. The best phone is {self.best_phone}.");
            self.won = True;
            return;
        } else {
            print("❌ Wrong guess!");
        }
        self.attempts -= 1;
        print(f"You have {self.attempts} attempts left.");
    }
}


# Run the game
with entry {
    game = BestPhoneSelectionGame();
    game.play();
}
