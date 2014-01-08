require_relative "../lib/bowling_game"

describe Game do

  describe "#score" do
    it "A game of all misses scores zero" do
      20.times { subject.roll(0) }
      expect(subject.score).to eq 0
    end

    it "A game of all ones scores twenty" do
      20.times { subject.roll(1) }
      expect(subject.score).to eq 20
    end

    it "A spare in the first frame followed by three pins followed by all misses should score 16" do
      2.times { subject.roll(5) }
      subject.roll(3)
      17.times { subject.roll(0) }
      expect(subject.score).to eq 16
    end

    it "A strike in the first game followed by three and then four pins followed by all misses should score 24" do
      1.times { subject.roll(10) }
      subject.roll(3)
      subject.roll(4)
      16.times { subject.roll(0) }
      expect(subject.score).to eq 24
    end
  end

end
