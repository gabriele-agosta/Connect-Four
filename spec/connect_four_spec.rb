require "./lib/connect_four.rb"

describe ConnectFour do 
  let(:grid) do
    white_circle = "\u26AA"
    Array.new(7) { [white_circle] * 6 }
  end

  let(:game) { ConnectFour.new }

  describe "#create_grid" do 
    it "returns a clean grid" do 
      expect(game.send(:create_grid)).to eql(grid)
    end
  end

  describe "#print_grid" do
    it "prints the grid" do
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
      red_circle = "\u1F534"
      expect(game.send(:choose_token, 1)).to eql(red_circle)
    end
    
    it "returns yellow circle for player 2" do
      yellow_circle = "\u1F7E1"
      expect(game.send(:choose_token, 2)).to eql(yellow_circle) 
    end
  end

  describe "#insert_token" do
    it "inserts a token on the first column" do
      
    end
  end

  # describe "#game_over?" do end 
  # -o la grid è piena
  # -oppure devo controllare se qualcuno ha vinto
end