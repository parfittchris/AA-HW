# Exercise 1
class Stack
  def initialize
    @stack = []
  end

  def push(el)
    @stack << el
  end

  def pop
    @stack.pop
  end

  def peek
    @stack[-1]
  end
end

# Exercise 2
class Queue
  attr_reader :queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
  end

  def dequeue
    @queue.shift
  end

  def peek
    @queue.first
  end
end

# Exercise 3
class Map
  attr_reader :map

  def initialize
    @map = []
  end

  def set(key, value)
    exists = false
    @map.each do |ele|
      if ele.first == key
        ele[-1] = value
        exists = true
      end
    end
    @map << [key, value] if exists == false
  end

  def get(key)
    @map.each {|ele| return ele[-1] if ele.first == key}
  end

  def delete(key)
    @map.each {|ele| @map.delete(ele) if ele.first == key}
  end

  def show
    p @map
  end
end
