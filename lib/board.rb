class Board
  
  attr_reader :grid, :length, :ships, :size
 
  def initialize(num)
    @grid = Array.new(num) { Array.new(num, :N)}
    @size = num * num
    @ships = size * 0.25
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
  end

  def hidden_ships_grid
    grid.map do |row|
      row.map do |ele|
        if ele == :S
          ele = :N
        else
          ele
        end
      end
    end
  end

  def print
    print_grid(self.hidden_ships_grid)
  end

  def reveal
    print_grid(grid)
  end

  def attack(pos)
    if self[pos] == :S
      puts "HIT! You sunk my battleship!"
      self[pos] = :H
      return true
    else
      puts "MISS!"
      self[pos] = :X
      false
    end
  end
  
  def num_ships
    grid.flatten.count{ |ele| ele == :S}
  end
end
