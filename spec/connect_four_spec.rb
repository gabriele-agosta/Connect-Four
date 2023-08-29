require "./lib/connect_four.rb"

describe ConnectFour do 
  let(:grid) do
    white_circle = "\u26AA"
    Array.new(7) { [white_circle] * 6 }
  end
  let(:game) { ConnectFour.new }
  let(:white_circle) { "\u{26AA}" }
  let(:red_circle) { "\u{1F534}" }
  let(:yellow_circle) { "\u{1F7E1}" }

  describe "#create_grid" do 
    it "returns a clean grid" do 
      expect(game.send(:create_grid)).to eql(grid)
    end
  end

  describe "#get_input" do 
    it "returns player input" do
      game = ConnectFour.new
      input_value = 6
      allow(game).to receive(:get_input).and_return(input_value)
      expect(game.get_input()).to eql(input_value)
    end
    it "asks user for valid input" do
      game = ConnectFour.new
      invalid_input = 0
      allow(game).to receive(:gets).and_return(invalid_input)
      expect(game.get_input()).to eql("You can't pick a column outside the grid")
    end
  end 

  describe "#choose_token" do
    it "returns red circle for player 1" do
      expect(game.send(:choose_token, 1)).to eql(red_circle)
    end
    
    it "returns yellow circle for player 2" do
      yellow_circle = "\u{1F7E1}"
      expect(game.send(:choose_token, 2)).to eql(yellow_circle) 
    end
  end

  describe "#insert_token" do
    it "inserts a token on the first column" do
      grid[0][0] = red_circle
      game.send(:insert_token, 0, 1)
      actual_grid = game.instance_variable_get(:@grid)
      expect(actual_grid).to eql(grid)
    end
  end

  describe "#check_horizontally" do
  end

  describe "#check_vertically" do
    context "when there is a vertical win" do
      it "returns true if player 1 won vertically" do
        4.times { |i| grid[0][i] = red_circle }
        game.instance_variable_set(:@grid, grid)
        expect(game.send(:check_vertically)).to be true
      end

      it "returns true if player 2 won vertically" do
        4.times { |i| grid[0][i] = yellow_circle }
        game.instance_variable_set(:@grid, grid)
        expect(game.send(:check_vertically)).to be true
      end
    end
  end

  describe "#check_horizontally" do
    context "when there is a horizontal win" do
      it "returns true if player 1 won horizontally" do
        4.times { |i| grid[i][0] = red_circle }
        game.instance_variable_set(:@grid, grid)
        expect(game.send(:check_horizontally)).to be true
      end

      it "returns true if player 2 won horizontally" do
        4.times { |i| grid[i][0] = yellow_circle }
        game.instance_variable_set(:@grid, grid)
        expect(game.send(:check_horizontally)).to be true
      end
    end
  end

  describe "#check_obliquely" do
    context "when there is a oblique win" do
      it "returns true if player 1 won obliquely" do 
        4.times { |i| grid[i][i] = red_circle }
        game.instance_variable_set(:@grid, grid)
        expect(game.send(:check_obliquely)).to be true
      end

      it "returns true if player 2 won obliquely" do 
        4.times { |i| grid[i][i] = yellow_circle }
        game.instance_variable_set(:@grid, grid)
        expect(game.send(:check_obliquely)).to be true
      end
    end 
  end

  describe "#game_over?" do
    it "returns false if the grid is empty" do
      game.instance_variable_set(:@grid, grid)
      expect(game.game_over?(1)).to be false
    end

    it "returns a message if the grid is full" do 
      free_spots = game.instance_variable_get(:@first_unused_spot)
      actual_grid = game.instance_variable_get(:@grid)
      values = [red_circle, yellow_circle]

      actual_grid.each_with_index do |column, col_index|
        column.each_with_index do |_, row_index|
          actual_grid[col_index][row_index] = values.sample
          free_spots[col_index] += 1
        end
      end
      expect(free_spots).to eql([6, 6, 6, 6, 6, 6, 6])

      expect(game.game_over?(1)).to eql("The game ended in a tie!")
    end
  end
end