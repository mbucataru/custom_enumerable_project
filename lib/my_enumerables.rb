module Enumerable
  # Your code goes here
  def my_each_with_index(&block)
    self.length.times do |index|
      block.call(self[index], index)
    end
    self
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
array.my_each_with_index do |element, index|
  puts "The current element is #{element}"
  puts "The current index is #{index}"
end
