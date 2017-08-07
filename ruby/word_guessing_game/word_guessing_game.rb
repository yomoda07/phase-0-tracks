=begin
Pseudocode for a word guessing game-------------------
- define a class named Word_guessing_game
- create initialize method
  INPUT: secret word
  STEP: declare
      guess counter
      a variable to check if game finished and set FALSE to it.
      guess limit
      current state for feedback
  OUTPUT: Nothing
- Create method to check if user input is equal to answer.
  INPUT: secret word, input word
  STEP:
  IF input word is equal to the secret word
    - set TRUE to the variable for checking if game finished
    - RETURN congratulatory message
  - ELSIF remaining count is equal to 0
    - Set TRUE to the variable for checking if game finished
    - return taunting message
  - ELSE
    - call showing feedback method
    END
  OUTPUT: String
- Create a method to show feedback
  INPUT: secret word, input word
  STEP:
  - Split the input word into each letter and set it to array.
  - extract each letter in the array and compare with the letter in the secret word
    - IF those letters are same
      - assign it to corresponding place in current state array
    - combine letters in array into string
  OUTPUT: String
- Create a method to calculate remaining
  INPUT: limit times, guess count
  STEP:
  - caluculate remaining times
  OUTPUT: Integer
-------------------------------------------------------
=end

class Word_guessing_game
  attr_reader :guess_count, :limit, :game_finised, :current_state, :remaining
  def initialize(secret_word)
    @secret_word = secret_word
    @guesses = []
    @game_finised = false
    @words_count = secret_word.length
    secret_word.length < 10 ? @limit = secret_word.length + 5 : @limit = secret_word.length
    @current_state = []
    secret_word.length.times { @current_state << "_" }
  end

  def check_guess(input_letter)
    @guesses << input_letter unless @guesses.include?(input_letter)
    @secret_word.chars.each_with_index do |letter, i|
      @current_state[i] = letter if input_letter == letter
    end
    @current_state.join(" ")
  end

  def calculate_remaining
    remaining = @limit - @guesses.length
    if remaining == 0
      @game_finised = true
      "You lost..."
    else
      "The remaining #{remaining} times\n\n"
    end
  end
end

# # Driver code
# puts "Please input secret word."
# secret_word = gets.chomp
# game = Word_guessing_game.new(secret_word)
#
# until game.game_finised do
#   puts "Guess the secret #{secret_word.length}-letter word!(input a letter)"
#   input_word = gets.chomp
#   puts game.check_guess(input_word)
#   if !game.current_state.include?("_")
#     puts "Bingo! You won!"
#     break
#   end
#   puts game.calculate_remaining
# end
