module TicTacToe
#store everything in this module
#create a cell class with an attribute value, could be empty or defined
#unmutable
  class Cell
    attr_accessor :value
    def initialize(value = "")
      @value = value
    end
  end
end
