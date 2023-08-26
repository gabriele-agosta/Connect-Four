class ConnectFour
  def initialize() 
    @grid = create_grid()
  end

  def get_input()
    input = gets.to_i
    column = input.between?(1, 7) ? input : "You can't pick a column outside the grid"
    return column
  end

  private 

  def create_grid
    grid = Array.new
    white_circle = "\u26AA"
    6.times { grid.append([white_circle, white_circle, white_circle, white_circle, white_circle, white_circle, white_circle]) }
    return grid
  end
end