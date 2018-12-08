#extending the Ruby language by tweaking the Array class to check itselt for empty elements
#not wrapped in TicTacToe module
class Array
  def all_empty?
    self.all? { |elem| elem.to_s.empty? }
  end

  def all_same?
    self.all? { |element| element == self[0] }
  end

  def any_empty?
    self.any? { |element| element.to_s.empty? }
  end

  def none_empty?
    !any_empty?
  end
end
