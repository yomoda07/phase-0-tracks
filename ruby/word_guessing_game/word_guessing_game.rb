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
<<<<<<< HEAD
  - IF input word is equal to the secret word
=======
  IF input word is equal to the secret word
>>>>>>> a43c2b4fbf2454586d241d181bef6a0c306200bb
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
<<<<<<< HEAD
  INPUT: limit times, guess count
  STEP:
  - caluculate remaining times
  OUTPUT: Integer
  
#Drive code
=======
  STEP:
  - return limit - guess ount

>>>>>>> a43c2b4fbf2454586d241d181bef6a0c306200bb
- Ask user1 to input secret word
- Create an instance method takes input secret word.
- Create WHILE loop to execute the code until either of users win
  - Ask user2 to input guess
  - check the guess
  - show the current state
-------------------------------------------------------
=end


class Word_guessing_game
  attr_reader :guess_count, :limit, :game_finised
  def initialize(secret_word)
    @guess_count = 0
    @game_finised = false
    @words_count = secret_word.split(" ").length
    @limit = secret_word.length
    @current_state = []
    secret_word.length.times { @current_state << "_" }
  end

  def check_guess(secret_word, input_word)
    @guess_count += 1
    if secret_word == input_word
      @game_finised = true
      "Bingo! You won!"
    elsif calculate_remaining == 0
      @game_finised = true
      "You lost..."
    else
      show_feedback(secret_word, input_word)
    end
  end

  def show_feedback(secret_word, input_word)
    input_word.chars.each_with_index do |letter, i|
      @current_state[i] = letter if letter == secret_word.chars[i]
    end
    @game_finised = true if input_word == secret_word || calculate_remaining == 0
    @current_state.join(" ")
  end

  def calculate_remaining
    @limit - @guess_count
  end
end

# Driver code
puts "Pleas e input secret word."
ARGV.clear; secret_word = gets.chomp
50.times do |i|
   puts "======================"
   puts "Game start!" if i == 48
end
game = Word_guessing_game.new(secret_word)
loop do
  puts "Guess the secret #{secret_word.length}-letter word!"
  ARGV.clear; input_word = gets.chomp
  puts game.check_guess(secret_word, input_word)
  break if game.game_finised
  puts "The remaining #{game.calculate_remaining} times"
end
