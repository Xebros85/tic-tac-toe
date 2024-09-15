# Welcome to Tic Tac Toe!
require 'colorize'

class Game

  WIN_COMBOS = [[0, 1, 2], [3, 4, 5], [6, 7 ,8]], # Horizontal
                  [[0, 3, 6], [1, 4, 7], [2, 5, 8]], # Vertical
                  [[0, 4, 8], [2, 4, 6]] # Diagonal

  def initialize
    @board = Array.new(9, " ")
    @players = ["player one", "player two"]
    @current_player = @players[0]

    puts "\nWelcome to Tic Tac Toe!\n"
    puts "\nThe object of the game is to get 3 of your markers in a row"
    puts "either in a vertical line, horizontal line, or diagonal!\n\n"
  end 

  def player_one
    @players.first    
  end

  def player_two
    @players.last    
  end

  def switch_player
    if @current_player == @players[0]
      @current_player = @players[1]
    else
      @current_player = @players[0]
    end
  end

  def print_board
    puts
    puts "#{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts "---------"
    puts "#{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts "---------"
    puts "#{@board[6]} | #{@board[7]} | #{@board[8]}"
    puts     
  end 

  def valid_move
    print_board
    puts "#{@current_player.upcase.colorize(:blue)} it's your turn!" 
    print "Please enter your square number (1-9): "
    index = gets.chomp.to_i - 1
    if @board[index] != " " 
      puts "\nThat space is already occupied!\n".colorize(:yellow)      
    else
      if @current_player == "player one"
        @board[index] = "X".colorize(:green)
        switch_player
      else
        @board[index] = "O".colorize(:red)
        switch_player
      end      
    end               
  end

  def check_for_winner(board)
    WIN_COMBOS.any? { |line| (line - board).empty?}
  end
  
  def play_game
    puts "Select a space using 1 - 9, where 1 is upper left and 9 is lower right.\n\n"
    turn_count = 1
    while turn_count < 10 do
      if check_for_winner(@board) == false
        valid_move                   
        turn_count += 1
      else                    
        puts "#{@current_player.upcase} WINS!!".colorize(:green)
        break
      end
    end
  end
  
  
end

game = Game.new
game.play_game