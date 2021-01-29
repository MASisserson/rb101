## Mental Model

Tic Tac Toe is a 2 player game played on a 3x3 board. Each player takes a turn and
marks a square on the board. First player to reach 3 squares in a row, including diagonals,
wins. If all 9 squares are marked and no player has 3 squares in a row, then the game is a tie.

# Gameplay
1. Display the initial empty 3x3 board.
2. Ask the user to mark a square.
3. Computer marks a square.
4. Display the updated board state.
5. If winner, display winner.
6. If board is full, display tie.
7. If neither winner nor board is full, go to #2
8. Play again?
9. If yes, go to #1
10. Good bye!

# Bonus 2
1. Update score method
2. Someone won set mothod
3. Player and computer score hash
4. Turn into a set request.
5. Display score method

# Final Additions
1. Create messages yml
2. Improve input validations
3. Extract more methods
4. Rename 'about_to_score' method
5. Display a winner announcement that actually shows up
6. A way to choose to have the loser go first

# Problems discovered after
1. When choosing the computer to go first, if choose best of 9, you go first instead
2. Even if computer is set to go first without choice, this happens
