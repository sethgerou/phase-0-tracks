require_relative 'wordgame'
describe Wordgame do
  let(:game) {Wordgame.new("userword")}

  it "stores player 1's word" do
    expect(game.get_word).to eq ["u","s","e","r","w","o","r","d"]
  end

  it "evaluates whether guess is in word" do
    game.guess("d")
    expect(game.word_status).to eq ["-","-","-","-","-","-","-","d"]
  end

  it "stores guess in an array of guesses" do
    game.guess("u")
    expect(game.guessed).to include("u")
  end

  it "adds guess to word status (if it's in word)" do
    game.guess("w")
    expect(game.word_status).to eq ["-","-","-","-","w","-","-","-"]
  end

  it "adjusts the count of available guesses if !guess-in-word" do
    game.guess("p")
    expect(game.guess_count).to eq 15
  end

  it "displays the current word status" do
    expect(game.word_status).to eq ["-","-","-","-","-","-","-","-"]
  end


  it "generates the end message" do
    expect(game.end_message("lose")).to eq "Sorry, keep trying kid! Player 1's word was 'userword'."
  end
end
