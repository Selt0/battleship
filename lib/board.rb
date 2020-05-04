class Board
  
  attr_reader :grid, :length, :ships
 
  def initialize(num)
    @grid = Array.new(num) { Array.new(num, '_')}
    @ships = num * num * 0.25
    @length = num
  end

  def [](pos)
    x, y = pos
    grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    grid[x][y] = value
  end

  def print_grid(grid)
    puts "  #{(0..length - 1).to_a.join(' ')}"
    grid.each_with_index do |row, i|
      puts "#{i} #{row.join(' ')}"
    end
  end

  def place_random_ships
    total_ships = 0

    while total_ships < ships
      rand_pos = Array.new(2) { rand(length) }
      next if self[rand_pos] == :S
      self[rand_pos] = :S
      total_ships += 1
    end
    nil
  end

  def hidden_ships
    grid.map do |row|
      row.map do |ele|
        if ele == :S
          ele = '_'
        else
          ele
        end
      end
    end
  end

  def print
    print_grid(self.hidden_ships)
  end

  def reveal
    print_grid(grid)
  end
end
