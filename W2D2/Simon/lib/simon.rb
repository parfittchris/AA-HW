class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    p "Let's play Simon!"
    sleep 1
    system("clear")
    until @game_over == true
      take_turn
    end
      game_over
  end

  def game_over
    game_over_message
    reset_game
    sleep 5
    system("clear")
    play
  end

  def take_turn
    show_sequence
    require_sequence
    if @game_over == false
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    @seq.each_with_index do |color, i|
      p 'Remember these colors!'
      p (i + 1).to_s + ": " + color.to_s
      sleep 1
      system("clear")
    end
  end

  def require_sequence
    p "Please enter the color sequence, pressing enter after each color."

    @seq.each do |color|
      input = gets.chomp
        if input != color
        @game_over == true
        game_over
      end
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    p 'Yay! You made it through the round!'
    sleep 2
    system("clear")
  end

  def game_over_message
    p 'Oops, that was the wrong color! Game over.'
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

test = Simon.new
test.play