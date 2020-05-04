class Player

  def get_move
    move = nil
    until move 
      puts "Enter a position on the board (e.g., 3 4)"
      begin
        move = gets.chomp.split.map(&:to_i)
      rescue => exception
        puts "Invalid move"
        puts
        move = nil
      end
    end
    move
  end

end
