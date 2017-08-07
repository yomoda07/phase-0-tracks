require_relative 'word_guessing_game'

describe Word_guessing_game do
  let(:game) {Word_guessing_game.new("word")}
  it "create instance variables" do
    expect(game.game_finised).to eq false
    expect(game.limit).to eq 9
    expect(game.current_state).to eq ["_", "_", "_", "_"]
  end

  it "check guess and show the feedback" do
    expect(game.check_guess("w")).to eq "w _ _ _"
  end

  it "calculate the remaining times" do
    expect(game.calculate_remaining).to eq "The remaining 9 times\n\n"
  end
end
