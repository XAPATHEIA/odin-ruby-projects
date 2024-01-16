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


  # TODO: 
  # 1. Game isn't switching appropriately between AI and Human player
  # 2. Winning condition checkers don't seem to be passing the entire player object to the method it calls
  # 3. Have not implemented a system yet that prevents either player from placing their symbol inside somewhere that 
  #    might already have a symbol.


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
        self.player_choice
      else
        puts "#{@player_two.name}, enter your co-ordinates separated by a comma: "
        @current_symbol = @player_two.symbol
        self.player_choice
      end
    else
      if @player_start == 1
        @player_start = 2
        if @player_start == @player_one.turn
          puts "#{@player_one.name}, enter your co-ordinates separated by a comma: "
          @current_symbol = @player_one.symbol
          self.player_choice
        end
      elsif @player_start == 2
        @player_start = 1
        if @player_start == @player_two.turn
          puts "#{@player_one.name}, enter your co-ordinates separated by a comma: "
          @current_symbol = @player_two.symbol
          self.player_choice
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
  end

  def choice_placement
    if @coords == ['0', '0']
      @board[0][0] = @current_symbol
    elsif @coords == ['0', '1']
      @board[0][1] = @current_symbol
    elsif @coords == ['0', '2']
      @board[0][2] = @current_symbol
    elsif @coords == ['1', '0']
      @board[1][0] = @current_symbol
    elsif @coords == ['1', '1']
      @board[1][1] = @current_symbol
    elsif @coords == ['1', '2']
      @board[1][2] = @current_symbol
    elsif @coords == ['2', '0']
      @board[2][0] = @current_symbol
    elsif @coords == ['2', '1']
      @board[2][1] = @current_symbol
    elsif @coords == ['2', '2']
      @board[2][2] = @current_symbol
    end
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
      puts "#{@player_one.name}'s turn is #{@player_one.turn} right now."
      puts "#{@player_two.name}'s turn is #{@player_two.turn} right now."
      puts "Current symbol is #{@current_symbol}"
      puts "#{@player_one.name}'s current symbol is #{@player_one.symbol}"
      puts "#{@player_two.name}'s current symbol is #{@player_two.symbol}"
      self.display_board
      self.toggle_player_choice
      self.player_choice
      self.choice_placement
      self.score_across
      self.score_diagonal
      self.score_down
      system "clear" 
    end
    puts "Thanks for playing!"
  end

  def declare_winner(player)
    @winner = true
    puts "#{@player.name} wins this round."
    @player.games_won += 1
    puts "#{@player.name} has won #{player.games_won} game/s."
  end

  def score_across
    if (@board[0][0] != "-" && @board[0][0] == @board[0][1] && @board[0][1] == @board[0][2]) ||
      (@board[1][0] != "-" && @board[1][0] == @board[1][1] && @board[1][1] == @board[1][2]) ||
      (@board[2][0] != "-" && @board[2][0] == @board[2][1] && @board[2][1] == @board[2][2])
      if @player_one.symbol == @board[0][0]
        self.declare_winner(@player_one)
      else
        self.declare_winner(@player_two)
      end
    end
  end

  def score_down
    if (@board[0][0] != "-" && @board[0][0] == @board[1][0] && @board[1][0] == @board[2][0]) ||
      (@board[0][1] != "-" && @board[0][1] == @board[1][1] && @board[1][1] == @board[2][1])  ||
      (@board[0][2] != "-" && @board[0][2] == @board[1][2] && @board[1][2] == @board[2][2])
      if @player_one.symbol == @board[0][0]
        self.declare_winner(@player_one)
      else
        self.declare_winner(@player_two)
      end
    end
  end

  def score_diagonal
    if (@board[0][0] != "-" && @board[0][0] == @board[1][1] && @board[1][1] == @board[2][2]) ||
      (@board[0][2] != "-" && @board[0][2] == @board[1][1] && @board[1][1] == @board[0][0])
      if @player_one.symbol == @board[0][0]
        self.declare_winner(@player_one)
      else
        self.declare_winner(@player_two)
      end
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