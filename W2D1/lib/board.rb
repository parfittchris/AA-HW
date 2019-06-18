require "byebug"

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) {[]}
    self.place_stones
    @name1 = name1
    @name2 = name2
  end

  def place_stones
    @cups.each_with_index do |cup, i|
      if i != 6 && i != 13
        4.times do 
          cup << :stone
        end
      end
    end
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' if start_pos < 0 || start_pos >= 13 || start_pos == 11
    raise 'Starting cup is empty' if @cups[start_pos].empty?
  end

  def make_move(start_pos, player)
      count = @cups[start_pos].length
      ending_id = (start_pos + count) % 14
       
      i = start_pos
      until @cups[start_pos].length == 0 do
        if (i == 7 && player == @name2) || (i == 13 && player == @name1)
          count += 1
          i += 1
        else
          @cups[(i + 1) % 13] << :stone
          @cups[start_pos].pop
          i += 1
        end
      end
      self.render
      self.next_turn(ending_id)
 
  end

  def next_turn(ending_id)
    if (ending_id == 7 || ending_id == 13)
      return :prompt
    elsif @cups[ending_id].length == 0
      return :switch
    elsif (1..6).include?(ending_id)
      return ending_id - 1
    else (7..12).include?(ending_id)
      return ending_id
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    # debugger

    (0..6).each {|i| return false if !@cups[i].empty?}
    (7..12).each {|j| return false if !@cups[j].empty?}
    return true
  end

  def winner
    if @cups[6].length > @cups[13].length
      return @name1
    elsif @cups[6].length < @cups[13].length
      return @name2
    else
      return :draw
    end
  end
end
