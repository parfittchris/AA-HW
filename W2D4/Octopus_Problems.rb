fish_array = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def longest_fish(arr)
  fish = ""

  (0...arr.length).each do |i|
    (i...arr.length).each do |j|
      fish = arr[i] if arr[i].length > arr[j].length && arr[i].length > fish.length
    end
  end
  fish
end


def merge_sort (array, &prc)
    return array if array.length <= 1

    mid_idx = array.length / 2
    merge(
      merge_sort(array.take(mid_idx), &prc),
      merge_sort(array.drop(mid_idx), &prc),
      &prc
    )
  end

  def merge(left, right, &prc)
    merged_array = []
    prc = Proc.new { |num1, num2| num1 <=> num2 } unless block_given?
    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged_array << left.shift
      when 0
        merged_array << left.shift
      when 1
        merged_array << right.shift
      end
    end

    merged_array + left + right
  end

  def dominant_octopus(arr)
    prc = Proc.new {|a,b| a.length <=> b.length}
    merge_sort(arr, &prc)[-1]
  end



  def clever_octopus(arr)
    fish = ""

    arr.each {|ele| fish = ele if ele.length > fish.length}

    return fish

  end



  tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]


  def slow_dance(position, arr)
    arr.each_with_index {|ele, idx| return idx if arr[idx] == position}
  end


  tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

  def fast_dance(position, hash)
    hash[position]
  end



  