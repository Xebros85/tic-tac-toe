# Welcome to Tic Tac Toe!
require 'colorize'

class Game

  WIN_COMBOS = [
    [0, 1, 2], 
    [3, 4, 5],
    [6, 7 ,8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def initialize
    @board = Array.new(9, " ")
    @check_board = Array.new(9, 0)
    @players = ["player one", "player two"]
    @current_player = @players[0]
    @turn_count = 1

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
    puts "#{@current_player.upcase} it's your turn!".colorize(:cyan) 
    print "Please enter your desired square (1-9): "
    index = gets.chomp.to_i - 1
    if @board[index] != " " 
      puts "\nThat space is already occupied!\n".colorize(:yellow)
      @turn_count -= 1            
    else
      if @current_player == "player one"
        @board[index] = "X".colorize(:red)
        @check_board[index] = 1        
      else
        @board[index] = "O".colorize(:green)
        @check_board[index] = -1        
      end      
    end
    @turn_count += 1               
  end

  def check_for_winner(check_board)
    WIN_COMBOS.each do |combo|
      sum = combo.sum { |index| check_board[index] }
      return true if sum == 3 # Player One wins
      return true if sum == -3 # Player Two wins
    end
    false       
  end
  
  def play_game
    puts "Select a space using 1 - 9, where 1 is upper left and 9 is lower right.\n\n"
    
    while @turn_count < 10 do
      print_board
      if check_for_winner(@check_board)
        switch_player
        puts "#{@current_player.upcase} WINS!!".colorize(:green)
        break

      else        
        valid_move
        switch_player       
      end

      if @turn_count == 10 && !check_for_winner(@check_board)
        print_board
        puts "It's a Draw!"
        break
      end
    end
  end    
end

game = Game.new
game.play_game