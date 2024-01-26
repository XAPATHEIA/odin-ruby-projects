class Game
  attr_reader :board, :player_one_name, :player_two_name, :player_start, :coords

  def initialize
    @player_start = rand(1..2)

    # Creates 3 x 3 board
    @board = Array.new(3) { Array.new(3, '-') }
    
    # Creates two objects using the Player class
    puts "What is your name?"
    @player_one = Player.new(gets.chomp, 'X')
    @player_two = Player.new('AI', 'O')
    @player_one.turn = 1
    @player_two.turn = 2
  end


  # IMPROVEMENTS:
  # 1. Use constants for Magic Values like 'X', 'O' and '-' i.e: 
  # class Game
  #   EMPTY_CELL = '-'
  #   PLAYER_ONE_SYMBOL = 'X'
  #   PLAYER_TWO_SYMBOL = '0'
  # end
  #
  # 2. Ternary operator for toggle_player_choice
  #
  # 3. Combine the Player Choice and Placement methods
  #
  # 4. Move draw check so that it's not being checked every round, and rather only
  #    when the game ends
  #
  # 5. Move the board movement options to the Player class as a method
  #    for more OOP code
  # 
  # 6. Making the handling of turns and movement options in the Player class 
  #    separates the responsibilities of the classes





  def valid_coordinates?(coords)
    coords.length == 2 &&
    coords.all? { |coord| coord.length == 1} &&
    coords.all? { |coord| ('0'..'2').cover?(coord) }
  end

  def toggle_player_choice
    if (@board.flatten.all? { |section| section == '-' })
      puts "--- Flipping a coin on who starts first ---"
      puts "-------------------------------------------"
      if @player_start == @player_one.turn
        puts "#{@player_one.name}, enter your co-ordinates separated by a comma: "
        @current_symbol = @player_one.symbol
      else
        puts "#{@player_two.name}, enter your co-ordinates separated by a comma: "
        @current_symbol = @player_two.symbol
      end
    else
      if @player_start == 1
        @player_start = 2
        if @player_start == @player_one.turn
          puts "#{@player_one.name}, enter your co-ordinates separated by a comma: "
          @current_symbol = @player_one.symbol
        elsif @player_start == @player_two.turn
          puts "#{@player_two.name}, enter your co-ordinates separated by a comma: "
          @current_symbol = @player_two.symbol
        end
      elsif @player_start == 2
        @player_start = 1
        if @player_start == @player_one.turn
          puts "#{@player_one.name}, enter your co-ordinates separated by a comma: "
          @current_symbol = @player_one.symbol
        elsif @player_start == @player_two.turn
          puts "#{@player_two.name}, enter your co-ordinates separated by a comma: "
          @current_symbol = @player_two.symbol
        end
      end
    end
  end

  def player_choice
    @coords = gets.chomp.split(",")
    # Until the co-ordinates provided are all integers, are within the board ranges
    # and have no additional whitespace
    # keep correcting user input

    until valid_coordinates?(@coords) do
      puts "Incorrect format, try again: "
      @coords = gets.chomp.split(",")
    end

    @coords = @coords.map(&:to_i)

    until @board[@coords[0]][@coords[1]] == "-" do
      puts "Cell already taken, try again: "
      @coords = gets.chomp.split(",").map(&:to_i)
    end
  end

  def choice_placement
    row, col = @coords.map(&:to_i)
    @board[row][col] = @current_symbol
  end


  def display_board
    puts board[0][0] + " | " + board[0][1] + " | " + board[0][2]
    puts board[1][0] + " | " + board[1][1] + " | " + board[1][2]
    puts board[2][0] + " | " + board[2][1] + " | " + board[2][2]
  end


  def play_game
    @winner = nil
    while @winner == nil
      if !(@board.flatten.include?("-"))
        @winner = 'DRAW'
        puts "The game is a draw!"
      end
      self.display_board
      self.toggle_player_choice
      self.player_choice
      self.choice_placement
      self.score_across
      self.score_diagonal
      self.score_down
    end
    puts "Thanks for playing!"
  end

  def declare_winner(player)
    @winner = true
    puts "#{player.name} wins this round."
    player.games_won += 1
    puts "#{player.name} has won #{player.games_won} game/s."
  end

  def symbol_player_check(board_symbol)
    if board_symbol == @player_one.symbol
      self.declare_winner(@player_one)
    else
      self.declare_winner(@player_two)
    end
  end

  def score_across
    if (@board[0].none?('-') && @board[0].all? { |symbol| symbol == @board[0][0]})
      self.symbol_player_check(@board[0][0])
    elsif (@board[1].none?('-') && @board[1].all? { |symbol| symbol == @board[1][0]})
      self.symbol_player_check(@board[1][0])
    elsif (@board[2].none?('-') && @board[2].all? { |symbol| symbol == @board[2][0]})
      self.symbol_player_check(@board[2][0])
    end
  end


  def score_down
    transposed_board = @board.transpose
    if (transposed_board[0].none?('-') && transposed_board[0].all? { |symbol| symbol == transposed_board[0][0] })
      self.symbol_player_check(@current_symbol)
    elsif (transposed_board[1].none?('-') && transposed_board[1].all? { |symbol| symbol == transposed_board[1][0] })
      self.symbol_player_check(@current_symbol)
    elsif (transposed_board[2].none?('-') && transposed_board[2].all? { |symbol| symbol == transposed_board[2][0] })
      self.symbol_player_check(@current_symbol)
    end
  end


  def score_diagonal
    if (@board[0][0] != "-" && @board[0][0] == @board[1][1] && @board[1][1] == @board[2][2])
      self.symbol_player_check(@board[0][0])
    elsif (@board[0][2] != "-" && @board[0][2] == @board[1][1] && @board[1][1] == @board[0][0])
      self.symbol_player_check(@board[0][2])
    end
  end

end

class Player
  attr_reader :name
  attr_accessor :games_won, :turn, :symbol

  def initialize(name, symbol)
    @games_won = 0
    @turn = 0
    @name = name
    @symbol = symbol
  end

end



a = Game.new()
a.play_game