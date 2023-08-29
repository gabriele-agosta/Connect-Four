class ConnectFour
  def initialize() 
    @white_circle = "\u26AA"
    @yellow_circle = "\u{1F7E1}"
    @red_circle = "\u{1F534}"
    @grid = create_grid()
    @first_unused_spot = [0, 0, 0, 0, 0, 0, 0]
  end

  def get_input()
    input = gets.to_i
    column = input.between?(1, 7) ? input : "You can't pick a column outside the grid"
    return column
  end

  def print_grid()
    5.downto(0) do |i|
      column = []
      for j in 0..6
        column.append(@grid[j][i])
      end
      column = column.map { |cell| cell }.join(" ")
      puts column
    end
  end

  def insert_token(column, player)
    token = choose_token(player)
    @grid[column][@first_unused_spot[column]] = token
    @first_unused_spot[column] += 1
  end

  def game_over?(player)
    return false if @grid.flatten.all? (@white_circle)
    return "The game ended in a tie!" unless @grid.flatten.any? @white_circle

    print_result(player) if check_horizontally() || check_vertically() || check_obliquely()
  end

  private 

  def create_grid
    return Array.new(7) { [@white_circle] * 6 }
  end

  def choose_token(player)
    return player == 1 ? @red_circle : @yellow_circle
  end

  def check_horizontally()
    3.times do |i|
      4.times do |j|
        elements = []
        4.times do |k|
          elements.append(@grid[j+k][i])
        end
        return true if elements.all? (@red_circle)
        return true if elements.all? (@yellow_circle)
      end
    end
    return false
  end

  def check_vertically()
    @grid.each do |column|
      5.times do |i|
        elements = column.slice(i, i+3)
        return true if elements.all? (@red_circle)
        return true if elements.all? (@yellow_circle)
      end
    end

    return false
  end

  def check_obliquely()
    3.times do |i|
      4.times do |j|
        elements = []
        4.times do |k|
          elements.append(@grid[j+k][i+k])
        end
        return true if elements.all? (@red_circle)
        return true if elements.all? (@yellow_circle)
      end
    end
    return false
  end

  def print_result(player)
    print_grid()
    puts "Congratulations Player #{player}, you won!"
    return true
  end
end