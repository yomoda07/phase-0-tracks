=begin
Pseudocode for a word guessing game-------------------
- define a class named Word_guessing_game
- create initialize method that take the input word as the argument
  - declare 3 instance variables,
      guess_count for storing how many times user guessed
      game_finished for storing boolean to check if game finished.
      limit assigned maximum times user can guess
      current_state for storing feedback
- Create method to check if user input is equal to answer.
  - IF user input is equal to the secret word
    - set true to game_finished
    - RETURN congratulatory message
  - ELSIF remaining count is equal to 0
    - Set true to game_finised
    - return taunting message
  - ELSE
    - call showing feedback method
- Create a method to show feedback
- Break the input word into each letter
- Iterate each letter and compare with the letter in the secret word
  - IF those letters are same
    - assign it to corresponding place in current state array
  - combine array into string and return it
- Create a method to calculate remaining
  - return limit - guess_count

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
