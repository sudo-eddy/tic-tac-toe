module TicTacToe
  #Board can be instantiated with a user specified hash or default values
  class Board
    attr_reader :grid
    def initialize(input = {})
      @grid = input.fetch(:grid default_grid)
    end
#by default Board is filled with empty cell objects
#can only respond to messages from self
    private

    def default_grid
      Array.new(3) { Array.new(3) { Cell.new } }
    end
  end
end
