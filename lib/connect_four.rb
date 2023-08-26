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
    @grid.each do |column|
      row_cell = column.map { |cell| cell }.join(" ")
      puts row_cell
    end
  end

  def insert_token(column, player)
    token = choose_token(player)
  end

  private 

  def create_grid
    grid = Array.new
    white_circle = "\u26AA"
    7.times { grid.append([white_circle, white_circle, white_circle, white_circle, white_circle, white_circle]) }
    return grid
  end

  def choose_token(player)
    yellow_circle = "\u1F7E1"
    red_circle = "\u1F534"
    return player == 1 ? red_circle : yellow_circle
  end

  def game_over?()
  end
end