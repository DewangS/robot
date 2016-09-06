Description : 

This is simple Robot simulator written in Ruby language. The core purpose of the app is to accept commands from the user in order to move the Robot on a set grid size. The application is terminal based which accepts various user inputs from the command line. Upon execution, it prompts the user to set the grid size in terms of length and width. Rest of the Robot moves are within these bounds. It is expected that the app will ensure that the Robot won't fall out off the set grid.

Prerequisite : Ruby 2.2.0 or later version installed 

How to run the application : from the command line run "ruby robot.rb"

Guide : 
        -  Upon execution, please specify the length and width of the grid
        -  Once grid size is set, you will be prompted with the below menu with valid commands\options
                
                1 PLACE 
                2 MOVE 
                3 LEFT 
                4 RIGHT 
                5 REPORT 
                0 Quit
        
        - The Robot MUST be placed at any valid location (i.e. within the boundries) on the grid BEFORE it can be moved.
          use the PLACE option#1 to place the Robot. The command accepts co-ordinates and the direction element in the 
          comma delimited form e.g. 0,0,N will place the Robot on the first position facing NORTH. This command can be used
          at any time during the execution to replace the Robot.

        - MOVE option#2 moves the Robot one step in the direction it's facing e.g. Robot placed at 0,0,North will move one 
          step in the north upon selecting this option

        - LEFT option#3 turns the Robot to it's LEFT e.g. If the Robot is currently facing NORTH, upon selecting this menu option will move it in the WEST direction

        - RIGHT option#4 turns the Robot to it's RIGHT e.g. If the Robot is currently facing NORTH, upon selecting this menu option will move it in the EAST direction

        - REPORT option#5 displays the current position and direction of the Robot

        - QUIT option#0 will end the execution of the program

Messages : During the placement or movement of the Robot, the program will display appropriate warning\alerts in case the 
           Robot is unable to move e.g. it's on the edge of the specified grid boundries etc. OR if Robot is not yet placed on the board.