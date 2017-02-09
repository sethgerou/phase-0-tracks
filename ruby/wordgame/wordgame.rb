# word guessing game
class Wordgame
  def initialize
  end

# user1 enters a word (or phrase?)
  def get_word
  end

# user2 attempts to guess the word(or phrase)
  def get_guess
  end

  # limited number of guesses - based on the word length
  # guessing the same guess twice does not count against the user
  # guessing correctly does not count against the user
  def guess_count
  end

  # user initially sees "------" in place of the word to guess.
  # as correct letters are guessed, they're added to the status like "--c---"
  def word_status
  end

  # user gets a congratulatory message when they guess correctly
  # user gets a taunting message if they lose
  def end_message(result)
  end

end
