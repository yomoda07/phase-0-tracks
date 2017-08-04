require_relative 'word_guessing_game'

describe Word_guessing_game do
  let(:game) {Word_guessing_game.new("word")}
  it "Create instance variables" do
    expect(game.guess_count).to eq 0
    expect(game.game_finised).to eq false
    expect(game.limit).to eq 4
  end

  it "Check guess and show the result" do
    expect(game.check_guess("word", "word")).to eq "Bingo! You won!"
  end

  it "Return feedback" do
    expect(game.show_feedback("word","bird")).to eq "_ _ r d"
  end

  it "Calculate the remaining times" do
    expect(game.calculate_remaining).to eq 4
  end
end
