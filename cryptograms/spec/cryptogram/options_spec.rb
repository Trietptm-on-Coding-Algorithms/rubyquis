require 'spec_helper'

describe Cryptogram::Options do
  context "with valid options" do
    before(:each) do
      @puzzle      = "cryptogram"
      @dictionary  = "/usr/share/dict/words"
      @options     = Cryptogram::Options.new(["--puzzle", @puzzle, "--dictionary", @dictionary])
    end

    it "should return the puzzle" do
      @options.puzzle.should eq(@puzzle)
    end

    it "should return the dictionary" do
      @options.dictionary.should eq(@dictionary)
    end
  end

  context "with invalid options" do
    it "should display the help message" do
      expect { Cryptogram::Options.new(["--something"]) }.to raise_error
    end
  end
end
