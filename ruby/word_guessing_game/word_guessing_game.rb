=begin
Pseudocode for a word guessing game-------------------
- define a class named word_guessing_game
- create initialize method that take the input word as an argument
  - declare  3 instance variables named
      secret_word to store the input word,
      guess_count to store how many times user guessed
      current_state to store an array of current status.
- Create method to check if user input is equal to answer.
  - Break the input word into each letter
  - Iterate each letter and compare with the letter in the secret word
    - IF those letter are same, assign it to corresponding place in current state array
  - IF current state array doesn't have underscore return true
  - ELSE return false
- Create method to show current state
  - combine array into string and show it

- Ask an user to input secret word
- Create an instance method takes input secret word.
- Create WHILE loop to execute the code until either of users win
  - Ask another user to input guessed
  - check the guessing
  - show the current state
- print a congratulatory or taunting message depends on the result.
-------------------------------------------------------
=end
