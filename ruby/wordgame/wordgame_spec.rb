require_relative 'wordgame'
describe Wordgame do
  let(:game) {Wordgame.new("userword")}

  it "stores player 1's word" do
    expect(game.get_word).to eq ["u","s","e","r","w","o","r","d"]
  end

  it "evaluates whether guess is in word" do
    expect(game.guess("u")).to be true
  end

  it "stores guess in an array of guesses" do
    game.guess("u")
    expect(game.guessed.include?("u")).to be true
  end

  it "adds guess to word status" do
    game.guess("w")
    expect(game.word_status).to eq ["-","-","-","-","w","-","-","-"]
  end

  it "adjusts the count of available guesses" do
    game.count_minus
    expect(game.guess_count).to eq 15
  end

  it "displays the current word status" do
    expect(game.word_status).to eq ["-","-","-","-","-","-","-","-"]
  end


  it "generates the end message" do
    expect(game.end_message("lose")).to eq "Sorry, keep trying kid."
  end
end
