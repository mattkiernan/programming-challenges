require "./word"

class Game
  def initialize
    @answer = generate_answer
    @guess_count = @answer.length
    @board = create_board
  end

  def play
    while game_on
      print_display_board
      guess = prompt_user
      guess_result = check_board_for(guess)
      update_game(guess, guess_result)
      check_game_status
    end
  end

  def generate_answer
    Word.new
  end

  def create_board 
    @answer.word.split("")
  end

  def create_display_board
    @display_board = []
    @answer.length.times do
      @display_board << " _ "
    end
  end

  def game_on
    @display_board.include?(" _ ") && @guess_count > 0 
  end

  def print_display_board
    puts "=" * 10
    puts ""
    @display_board.each do |letter|
      print letter
    end
    puts ""
    puts ""
  end

  def prompt_user
    print "Pick a letter > "
    gets.chomp.downcase
  end

  def check_board_for(guess)
    @board.each_index.select{|letter| @board[letter] == guess}
  end

  def update_game(guess, guess_result)
    if guess_result != []
      update_display_board(guess, guess_result)
    else
      display_wrong_guess(guess)
    end
  end

  def update_display_board(guess, guess_result)
    guess_result.each do |location|
      @display_board[location] = guess
    end
  end

  def count_guess
    @guess_count -= 1
    puts "#{@guess_count} guesses remaining"
  end

  def display_wrong_guess(guess)
    puts "There are no #{guess}'s "
    count_guess
  end

  def check_game_status
    game_on || game_lost || game_won
  end

  def game_lost
    if @display_board.include?(" _ ") && @guess_count == 0
      puts "Game over. The word was #{@answer.word}"
    end
    true
  end

  def game_won
    print_display_board
    puts "You win!"
  end
end

game = Game.new
game.create_display_board
game.play
