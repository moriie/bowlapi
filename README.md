# This is a miniature demonstration project.

## Notes 

First request is always POST of # of players.

Subsequent requests are player # and array of pins hit.

### RULES

When a strike is bowled, total of next two rolls is added to total of this round.

When a spare is bowled, total of next roll is added to total of this round.

### NOT INCLUDED / THOUGHTS

Relevant validation for player name with respect to game id.

Is checking whether or not # of players made conforms to # of players in the game needed? Current assumption is that this occurs on the frontend.
Should rounds be equal to bowling 'frames' and add to an object where player names are keys and an array of scores is their values?
