require_relative "board"
require_relative "player"

class Battleship

  attr_reader :player, :board

  def initialize(size)
    @board = Board.new(size)
    @player = Player.new
    @remaining_misses = board.size / 2
  end

  def start_game
    board.place_random_ships
    puts "Number of ships: #{board.ships}"
    board.print
  end

  def game_over?
    lose? || win?
  end

  def lose?
   if @remaining_misses <= 0
    puts "You lose!"
    return true
   end
   false
  end

  def win?
    if board.num_ships == 0
      puts 'You win!'
      return true
    end
    false
  end

  def turn
    if !board.attack(player.get_move)
      @remaining_misses -= 1
    end
    board.print
    puts "Remaining chances: #{@remaining_misses}"
  end
end
