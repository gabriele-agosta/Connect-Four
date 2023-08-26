require "./lib/connect_four.rb"

describe ConnectFour do 
  describe "#create_grid" do 
    it "returns a clean grid" do 
      game = ConnectFour.new
      grid = Array.new
      white_circle = "\u26AA"
      6.times { grid.append([white_circle, white_circle, white_circle, white_circle, white_circle, white_circle, white_circle]) }
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

  # describe "#game_over?" do end 
  # describe "#insert_token" do end
end