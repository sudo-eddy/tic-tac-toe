module TicTacToe
#Board can be instantiated with a user specified hash or default values
  class Board
    attr_reader :grid
    def initialize(input = {})
      @grid = input.fetch(:grid, default_grid)
    end
#by default Board is filled with empty cell objects
#can only respond to messages from self
    private

    def default_grid
      Array.new(3) { Array.new(3) { Cell.new } }
    end

#don't really get why we're flipping the coordinates
    def get_cell(x,y)
      grid[y][x]
    end
#dependent on get_cell, makes the cell object respond to value message
    def set_cell(x,y, value)
      get_cell(x,y).value = value
    end

#check if game is won tied or ongoing
    def game_over
      return :winner if winner?
      return :draw if draw?
      false
    end
#flatten goes through the data structure and returns a single array
    def draw?
      grid.flatten.map { |cell| cell.value }.none_empty?
    end

#Get the 8 possible winning positions
    def winning_positions
      grid + # rows
      grid.transpose + #transpose collects the columns
      diagonals #two diagonals
    end

    def diagonals
      [
        [get_cell(0,0), get_cell(1,1), get_cell(2,2)],
        [get_cell(0,2), get_cell(1,1), get_cell(2,0)],
      ]
    end

#iterate over the winning_positions return true if all values are all_same
#skip arrays that are all_empty 
    def winner?
      winning_positions.each do |winning_position|
        next if winning_position_values(winning_position).all_empty?
        return true if winning_position_values(winning_position).all_same?
      end
      false
    end

    def winning_position_values(winning_position)
      winning_position.map { |cell| cell.value }
    end



  end
end
