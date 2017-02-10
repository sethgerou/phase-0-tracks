# word guessing game
class Wordgame
  def initialize(word)
    @word = word.downcase.split("")
    @guess_count = word.length*2
    @word_status = ("-"*word.length).split("")
    @guessed = []
  end

# user1 enters a word (or phrase?)
  def get_word
    @word
  end

# user2 attempts to guess the word(or phrase)
  def guess(letter)
    if @word.include?(letter)
      # add the letter to the word status
      index = 0
      @word.each do |letterinword|
        if letterinword == letter
          @word_status[index] = letter
        end
        index += 1
      end
    elsif @guessed.include?(letter) # if the letter has already been guessed.
    else
      count_minus
    end
    @guessed.push(letter)
  end

  # limited number of guesses - based on the word length
  # guessing the same guess twice does not count against the user
  # guessing correctly does not count against the user
  def guess_count
    @guess_count
  end

  def count_minus
    @guess_count -= 1
  end

  def guessed
    @guessed
  end

  # user initially sees "------" in place of the word to guess.
  # as correct letters are guessed, they're added to the status like "--c---"
  def word_status
    @word_status
  end

  # user gets a congratulatory message when they guess correctly
  # user gets a taunting message if they lose
  def end_message(result)
    @messages = {
                win: "Congratulations! You win!, player 1's word was '#{@word.join("")}'.",
                lose: "Sorry, keep trying kid! Player 1's word was '#{@word.join("")}'."
              }
    if result == "win"
      @messages[:win]
    else
      @messages[:lose]
    end
  end

end
=begin # driver code
puts "Player 1, enter a word for player 2 to guess."
game = Wordgame.new(gets.chomp)
# puts "\n"*80
system "clear" or system "cls"

loop do
  puts game.word_status.join("")
  puts "Player 2, you have #{game.guess_count} guesses remaining."
  puts "Please guess a letter."
  game.guess(gets.chomp.downcase)

  if game.guess_count == 0
    break puts game.end_message("lose")
  end
  if !game.word_status.include?("-")
    break puts game.end_message("win")
  end
end
=end
