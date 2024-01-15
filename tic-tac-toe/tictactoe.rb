class Game
  attr_reader :board, :player_one_name, :player_two_name, :player_start
  @@winner = 0

  # [0,0] , [0,1] , [0,2]
  # [1,0] , [1,1] , [1,2]
  # [2,0] , [2,1] , [2,2]

  def initialize
    @player_start = rand(1..2)
    @board = Array.new(3) { Array.new(3, '-') }
    puts "Player 1 - enter your name: "
    @player_one_name = gets.chomp
    puts "Player 2 - enter your name: "
    @player_two_name = gets.chomp
  end
end

a = Game.new()
p a.board
puts a.player_one_name
puts a.player_two_name
puts a.player_start
