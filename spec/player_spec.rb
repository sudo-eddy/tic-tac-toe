require "spec_helper"

module TicTacToe
  describe Player do

  context "#initialize" do
    it "raises an exception when initialized with {}" do
      expect { Player.new({}) }.to raise_error
    end

    it "does not raise an error when initialized with a valid input hash" do
      input = { marker: "X", name: "Someone"}
      expect { Player.new(input) }.to_not raise_error
    end
  end

  context "#marker" do
    it "returns the marker" do
      input = { marker: "X", name: "Someone" }
      player = Player.new(input)
      expect(player.marker).to eq "X"
    end
  end

  context "#name" do
    it "returns the player's name" do
      input = { marker: "X", name "Someone" }
      player = Player.new(input)
      expect(player.name).to eq "Someone"
    end
  end

  end
end
