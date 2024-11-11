module Enumerable
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    0.upto(self.length-1) do |i|
      yield(self[i])
    end
    self
  end
  # Your code goes here
  def my_each_with_index
    0.upto(self.length-1) do |i|
      yield(self[i], i)
    end
    self
  end

  def my_select
    newArr = []
    self.my_each do |unit|
      newArr.push(unit) if yield(unit)
    end
    newArr
  end

  def my_all?
    self.my_each do |unit|
      return false unless yield(unit)
    end
    true
  end

  def my_any?
    self.my_each do |unit|
      return true if yield(unit)
    end
    false
  end

  def my_none?
    self.my_each do |unit|
      return false if yield(unit)
    end
    true
  end

  def my_count
    count = 0
    if block_given?
      self.my_each do |unit|
        count += 1 if yield(unit)
      end
      count
    else
      self.length
    end
  end

  def my_map
    newArr = []
    self.my_each do |unit|
      newArr << yield(unit)
    end
    newArr
  end

  def my_inject(val = nil)
    accumulator = val == nil ? self[0] : val
    self.my_each do |unit|
      accumulator = yield(accumulator, unit)
    end
    accumulator
  end
end
