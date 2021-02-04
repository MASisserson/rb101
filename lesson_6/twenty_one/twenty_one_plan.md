## Problem
1. Create a game of twenty-one with the base rule set
2. 

## PLAN
1. Initialize deck
  - Deck must be modified over the course of the game
  - Then it must be reset if played again.
2. Deal cards to players and dealer
  - Dealing must deplete the temp deck
  - Player's cards and one dealer card must be visible
  - After player stays or busts, dealer cards must be revealed
  - I want a display that shows cards as if in hand (i.e. '[9]')
  - display player and dealer hands with separate methods
    - dealer hand method also takes variable that reveals it when true
3. Player turn: hit or stay
  - repeat until bust or "stay"
  - Method can be used for player choice
  - Show player total value with Ace at max
4. If player bust, dealer wins.
5. Dealer turn: hit or stay
  - repeat until total >= 17
6. If dealer bust, player wins.
7. Compare cards and declare winner.

**Algorithm**

 ___
|   |
|♦7♦|
|___| Just display the first two cards.
After,display single cards.


## Other Functionality
1. Offer to explain rules at beginning.
2. Play again?
3. Pause at every dealer decision for 1 second. To build anticipation.


**Dealer Hand Total Value**
1. There are essentially two hands
  1. the initial dealer hand, consisting of one card
  2. The final dealer hand, consisting of two or more cards
2. The value of an ace is 11 if the total hand <= 21, and is 1 if hand > 21
3. The initial hand can always have aces equal 11
  - It also cannot check any other cards for an alternative value anyway
4. The final hand must check the value of all non ace cards, then determine ace value based on total so far. Then add to create final total.


1. Need to monitor player move
2. Break loop if 'bust' or player chose 'stay'
3. Could move bust? into player_move and look at return value
  - But then the player_move both mutates and has meaningful return values
4. Could make player_move return based solely and just return the new hand
  - But then the player_hand variable won't change outside of the loop
5. Dealer has to hit when merely even with the player

*Small Problems*
1. Value of A

number_of_aces = find_aces(hand)
until number_of_aces == 0 
  if bust?(total)
    number_of_aces -= 1
    total -= 10
end

2. Dealer hand shows full total
