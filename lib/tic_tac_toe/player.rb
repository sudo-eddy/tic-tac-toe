module TicTacToe
class Player
  #only read mode we dont wanna change the contents
  #list attributes with commas, input is a hash 
  attr_reader :marker, :name
  def initialize(input)
    @marker = input.fetch(:marker)
    @name = input.fetch(:name)
  end
 end
end
