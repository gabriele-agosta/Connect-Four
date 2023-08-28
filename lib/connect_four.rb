class ConnectFour
  def initialize() 
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

  def game_over?()
  end

  private 

  def create_grid
    white_circle = "\u26AA"
    grid = Array.new(7) { [white_circle] * 6 }
    return grid
  end

  def choose_token(player)
    yellow_circle = "\u{1F7E1}"
    red_circle = "\u{1F534}"

    return player == 1 ? red_circle : yellow_circle
  end
end