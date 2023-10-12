# TOY ROBOT

### Prerequisites
Ruby

### Running the game
Please enter `irb -r './main.rb'` in your console. The game will greet you with 'What would you like to do?'

The options are:
* PLACE X,Y,F (where X,Y are coordinates and F is a cardinal direction)
* MOVE
* LEFT
* RIGHT
* REPORT

### Test data
* PLACE 0,0,NORTH
* MOVE
*  REPORT
  * Output: 0,1,NORTH
* PLACE 0,0,NORTH
* LEFT
* REPORT
  * Output: 0,0,WEST
* PLACE 1,2,EAST
* MOVE
* MOVE
* LEFT
* MOVE
* REPORT
  * Output: 3,3,NORTH
