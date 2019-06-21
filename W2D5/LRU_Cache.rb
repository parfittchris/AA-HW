require 'byebug'
class LRUCache
  attr_reader :cache, :total_items

    def initialize(total_items)
      @cache = []
      @total_items = total_items
    end

    def count
      # returns number of elements currently in cache
      self.cache.length
    end

    def add(el)
      self.cache.delete(el) if cache.include?(el)
      self.cache.shift if self.cache.length >= total_items
      self.cache << el
    end

    def show
      # shows the items in the cache, with the LRU item first
      p self.cache
    end

    private
    # helper methods go here!

  end


  johnny_cache = LRUCache.new(4)
  # debugger
  johnny_cache.add("I walk the line")
  johnny_cache.add(5)

  johnny_cache.count # => returns 2

  johnny_cache.add([1,2,3])
  johnny_cache.add(5)
  johnny_cache.add(-5)
  johnny_cache.add({a: 1, b: 2, c: 3})
  johnny_cache.add([1,2,3,4])
  johnny_cache.add("I walk the line")
  johnny_cache.add(:ring_of_fire)
  johnny_cache.add("I walk the line")
  johnny_cache.add({a: 1, b: 2, c: 3})
  johnny_cache.show