"""A Number Guessing Game"""

import random
from byllm.llm import Model

glob llm = Model(model_name="gemini/gemini-2.0-flash", verbose=False)

"""Provide a fun hint if guess is incorrect"""
def give_hint(guess: int, correct_number: int) -> str by llm():
    return f"Your guess {guess} is {'too high' if guess > correct_number else 'too low'}! Try again!"

walker GuessGame {
    has guess: int

    can start with entry {
        spawn here ++> turn
    }

    can process_guess with entry {
        report give_hint(this.guess, here.correct_number)
    }
}

node turn {
    has correct_number: int = random.randint(1, 10)
}

with entry:__main__ {
    root spawn GuessGame(3)
    root spawn GuessGame(4)
    root spawn GuessGame(5)
    root spawn GuessGame(6)
}

