#require 'pry'

class Board
  attr_reader :length, :width

  @data=nil

  def initialize(row=5,col=5)
    @data = Array.new(row){Array.new(col){0}}
    @length = @data.length
    @width = @data[0].length
  end

end

class Robot
  
  DIRECTIONS={'N' => 'NORTH', 'E' => 'EAST' , 'W' => 'WEST', 'S' => 'SOUTH'}
  attr_accessor :curr_pos_x, :curr_pos_y, :curr_dir
  
  def initialize
    @curr_pos_x=0
    @curr_pos_y=0
    @curr_dir=nil
  end

  def move(board)
    case @curr_dir
        when DIRECTIONS.keys[0]
            if validMove(@curr_pos_x, @curr_pos_y+1, board)
              @curr_pos_y = @curr_pos_y + 1
            else
                outOfBounds
            end
        
        when DIRECTIONS.keys[1]
            if validMove(@curr_pos_x+1, @curr_pos_y, board)
              @curr_pos_x = @curr_pos_x + 1
            else
              outOfBounds
            end
        
        when DIRECTIONS.keys[2]
            if validMove(@curr_pos_x-1, @curr_pos_y, board)
              @curr_pos_x = @curr_pos_x - 1
            else
              outOfBounds
            end
        
        when DIRECTIONS.keys[3]
            if validMove(@curr_pos_x, @curr_pos_y-1, board)
              @curr_pos_y = @curr_pos_y - 1
            else
              outOfBounds
            end
    end      
  end

  def left
    case @curr_dir
          when DIRECTIONS.keys[0]
              @curr_dir = DIRECTIONS.keys[2]
          
          when DIRECTIONS.keys[1]
              @curr_dir = DIRECTIONS.keys[0]
          
          when DIRECTIONS.keys[2]
              @curr_dir = DIRECTIONS.keys[3]
          
          when DIRECTIONS.keys[3]
              @curr_dir = DIRECTIONS.keys[1]
    end      
  end

  def right
      case @curr_dir
        when DIRECTIONS.keys[0]
            @curr_dir = DIRECTIONS.keys[1]
        
        when DIRECTIONS.keys[1]
            @curr_dir = DIRECTIONS.keys[3]
        
        when DIRECTIONS.keys[2]
            @curr_dir = DIRECTIONS.keys[0]
        
        when DIRECTIONS.keys[3]
            @curr_dir = DIRECTIONS.keys[2]
      end
  end

  def changeDirection(face)
    if DIRECTIONS.include?(face)
      @curr_dir = face
      true
    else
      puts "Valid directions are #{DIRECTIONS.keys.join(',')}. Please try again!!"
      false
    end
  end

  def place(x=0,y=0,f='N',board)
    if validMove(x,y,board) 
        if changeDirection(f)
            @curr_pos_x = x
            @curr_pos_y = y
            true
          else
            false
        end
      else
        outOfBounds
        false
    end
  end

  def validMove(x,y,board)
    x >= 0 && y >= 0 && x < board.length && y < board.width
  end

  def outOfBounds
    puts "Warning : Out of bounds move. Please try again."
  end

  def currentPosition
    @curr_dir != nil ? "#{@curr_pos_x},#{@curr_pos_y},#{DIRECTIONS[@curr_dir]}" : "Robot is not placed on the board yet."
  end
end

class Robosim
  puts "Welcome to the Robot Simulator."
  
  def self.init
    x=y=0
    loop do
      puts "Enter grid length : "
      x = Integer(gets) rescue -1
      puts "Enter grid width : "
      y = Integer(gets) rescue -1
      
      if x <= 0 || y <= 0
        puts "Invalid dimension."
      else
        break
      end
    end
      @board = Board.new(x,y)
  end
  
  def self.menu
    puts "\t  1 PLACE 
          2 MOVE 
          3 LEFT 
          4 RIGHT 
          5 REPORT 
          0 Quit"
  end

  @robot = Robot.new
  Robosim.init

  puts "Your playing field is #{@board.length} x #{@board.width}"

  loop do 
    Robosim.menu
    choice = gets.chomp
    case choice
        when '0'
          break
        when '1'
          puts " Placement (Comma seperated x, y co-orinates and direction e.g. 0,0,N) : "
          placement = gets.chomp
          params=placement.split(',')
          x = Integer(params[0].lstrip.rstrip) rescue -1 if params.size > 0 
          y = Integer(params[1].lstrip.rstrip) rescue -1 if params.size > 1
          f = params[2].lstrip.rstrip.upcase if params.size > 2 
          @robot.place(x,y,f,@board) if x >= 0 && y >= 0
        when '2'
            @robot.move(@board)
        when '3'
            @robot.left
        when '4'
            @robot.right
        when '5'
             puts @robot.currentPosition        
        else
          puts "Invalid choice. Please try again."       
    end
  end
end