class Player

  def get_move
    puts "Enter a position on the board (e.g., 3 4)"
    
    move = gets.chomp.split.map(&:to_i)
  end

end
