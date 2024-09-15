# Welcome to Tic Tac Toe!

class Game

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]
    @players = ["player_one", "player_two"]
    @current_player = "player_one"
  end 

  def player_one
    @players.first
  end

  def player_two
    @players.last
  end

  def switch_player
    
  end

  def print_board
    puts "#{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts "---------"
    puts "#{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts "---------"
    puts "#{@board[6]} | #{@board[7]} | #{@board[8]}"
    puts     
  end
    

  def start_game
    puts "\nWelcome to Tic Tac Toe!\n"
    puts "\nThe object of the game is to get 3 of your markers in a row"
    puts "either in a vertical line, horizontal line, or diagonal!\n\n"
  end

  def play_game

    puts "Select a space using 1 - 9, where 1 is upper left and 9 is lower right.\n\n"    
    print_board
  end
end

game = Game.new
game.start_game
game.play_game