require 'rspec'
require 'word'

describe Word do
  before do
    Word.clear
  end

  it 'initializes an instance of the word class' do
    test_word = Word.new('boat',"English")
    test_word.should be_an_instance_of Word
  end
  it 'initializes with a language' do
    test_word = Word.new("boat", "English")
    test_word.language.should eq "English"
  end
  describe ".create" do
    it "creates an instance of the Word Class" do
      test_word = Word.create("boat", "English")
      test_word.word.should eq "boat"
      test_word.language.should eq "English"
    end
    it "saves the word instance into the words array" do
      test_word = Word.create("boat", "English")
      Word.all.should eq [test_word]
    end
  end
  describe ".all" do
    it "starts with an empty array" do
      Word.all.should eq []
    end
    it "contains all word instances" do
      test_word1 = Word.create("boat", "English")
      test_word2 = Word.create("casa", "Spanish")
      Word.all.should eq [test_word1, test_word2]
    end
  end
  describe ".clear" do
    it "clears the all_words array" do
      Word.clear.should eq []
    end
  end

  describe '#edit_word' do
    it 'edits a terms word' do
      test_word = Word.create("ZZebra", "english")
      test_term = Term.create(test_word, "A striped horse")
      test_term.word.edit_word("Zebra")
      test_term.word.word.should eq "Zebra"
    end
    it 'edits a terms word anywhere inside the all_terms array' do
      test_word1 = Word.create("ZZebra", "english")
      test_term1 = Term.create(test_word1, "A striped horse")
      test_word2 = Word.create("DDoe", "english")
      test_term2 = Term.create(test_word2, "deer")
      test_term2.word.edit_word("Doe")
      test_term2.word.word.should eq "Doe"
    end
    # NEED TO FIX ADD WORD FIRST
    # it 'edits any word in a term' do
    #   test_word1 = Word.create("ZZebra", "english")
    #   test_term1 = Term.create(test_word1, "A striped horse")
    #   test_term1.word.edit_word("Zebra")
    #   test_term1.word.word.should eq "Zebra"
    # end
  end
  # describe "add_words" do
  #   it "should add a new word object to the existing all_words array" do
  #     test_word1 = Word.create("zebra", "english")
  #     test_term = Term.create(test_word1, "a striped horse")
  #     test_term.edit_word("cebra", "Spanish")
  #     test_term.word.should eq (test_word1, test_word2)
  #   end
  # end
  # describe "#find_word_index" do
  #   it "will find the index of the word array" do
  #     test_term = Term.create("Zebra", "A striped horse")
  #     # test_term.multi_words('Black n white horse')
  #     test_term.find_word_index('Zebra', 0).should eq 0
  #   end
  # end
end
