module Enumerable
  # Your code goes here
  def my_each_with_index(&block)
    self.length.times do |index|
      block.call(self[index], index)
    end
    self
  end

  def my_select(&block)
    return_array = []
    self.my_each do |element|
      return_array << element if block.call(element)
    end
    return_array
  end

  def my_all?(&block)
    self.my_each do |element|
      return false unless block.call(element)
    end
    true
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each(&block)
    self.length.times do |index|
      block.call(self[index])
    end
    self
  end
end

array = [5, 3, 2]
p array.my_all? { |element| element > 2 }
