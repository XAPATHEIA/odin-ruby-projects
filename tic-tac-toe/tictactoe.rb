class Game
  attr_reader :board, :player_one_name, :player_two_name, :player_start, :coords

  # [0,0] , [0,1] , [0,2]
  # [1,0] , [1,1] , [1,2]
  # [2,0] , [2,1] , [2,2]


  #TODO: 
  #1. Implement turn system, find a way to remember between player 1 or 2, maybe
  #   a class variable is necessary, not sure
  #2. Create a method that begins to populate the board using co-ordinates provided
  #   adjust the "player_choice" method so that it asks the correct player for their
  #   coords. I imagine the loop to constantly call "player_choice" will exist in the
  #   populate board method, since it will be the method that checks whether it's full
  #   or not, however, that also means that the methods that check the condition of whether
  #   the game has been won or not must be written first as that will also need to be called
  #   as the board is being updated (real-time win or loss)
  #3. Find a way to play the entire game with only one call to the class object, like
  #   'class-name.play_game'

  def initialize
    @winner = nil
    @player_start = rand(1..2)

    # Creates 3 x 3 board
    @board = Array.new(3) { Array.new(3, '-') }
    
    # Creates two objects using the Player class
    puts "What is your name?"
    @player_one = Player.new(gets.chomp)
    @player_two = Player.new('AI')
  end


  def player_choice
    puts "Enter your co-ordinates separated by a comma: "
    @coords = gets.chomp.split(",")
    # Until the co-ordinates provided are all integers, are within the board ranges
    # and have no additional whitespace
    # keep correcting user input

    until valid_coordinates?(@coords) do
      puts "Incorrect format, try again: "
      @coords = gets.chomp.split(",")
    end
  end


  def valid_coordinates?(coords)
    coords.length == 2 &&
    coords.all? { |coord| coord.length == 1} &&
    coords.all? { |coord| ('0'..'2').cover?(coord) }
  end

end


class Player
  attr_reader :turn, :name

  def initialize(name)
    @turn = rand(1..2)
    @name = name
    @score = 0
  end

  # Only allows the score to be accessed by other objects
  protected
  attr_reader :score

end



a = Game.new()
a.player_choice
p a.board
puts a.player_one_name
puts a.player_two_name
puts a.player_start
p a.coords
