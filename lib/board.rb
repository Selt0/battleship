class Board
  
  attr_reader :grid, :size
  def initialize(size)
    @grid = Array.new(size) { Array.new(size, '_')}
    @size = size
  end
  
  def print_grid(grid)
    puts "  #{(0..size - 1).to_a.join(' ')}"
    grid.each_with_index do |row, i|
      puts "#{i} #{row.join(' ')}"
    end
  end
end
