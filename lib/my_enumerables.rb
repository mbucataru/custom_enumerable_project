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

  def my_any?(&block)
    self.my_each do |element|
      return true if block.call(element)
    end
    false
  end

  def my_none?(&block)
    self.my_each do |element|
      return false if block.call(element)
    end
    true
  end

  def my_count(arg = nil, &block)
    count_return = 0
    if block_given?
      self.my_each do |element|
        count_return += 1 if block.call(element)
      end
      count_return
    elsif arg == nil
      self.length
    else
      self.my_each do |element|
        count_return += 1 if element == arg
      end
      count_return
    end
  end

  def my_map(&block)
    return_array = []
    self.my_each do |element|
      return_array << block.call(element)
    end
    return_array
  end

  def my_inject(arg = nil, &block)
    if arg
      return_sum = arg
    else
      return_sum = self[0]
    end
    self.my_each_with_index do |element, index|
      next if index == 0
      return_sum = block.call(return_sum, element)
    end
    return_sum
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
