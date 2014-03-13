require 'rspec'
require 'term'
require 'word'

describe Term do
  before do
    Term.clear
  end

  it 'initializes an instance of the Term class' do
    test_term = Term.new("zebra", "A striped horse")
    test_term.should be_an_instance_of Term
  end
  it 'initializes with an instance of word' do
    test_word = Word.create("Zebra", "english")
    test_term = Term.new(test_word, "A striped horse")
    test_term.word.word.should eq 'Zebra'
  end
  it 'initializes with an instance of definition' do
    test_term = Term.new("Zebra", "A striped horse")
    test_term.definition.should eq ["A striped horse"]
  end

  describe '.create' do
    it 'creates a new initialized instance of Term' do
      test_word = Word.create("zebra", "english")
      test_term = Term.create(test_word, "a striped horse")
      test_term.word.word.should eq "zebra"
      test_term.word.language.should eq "english"
      test_term.definition.should eq ["a striped horse"]
    end
    it 'saves the term object into the all_terms array' do
      test_term = Term.create("zebra", "A striped horse")
      Term.all.should eq [test_term]
    end
  end
  describe '.all' do
    it 'starts out as an empty array' do
      Term.all.should eq []
    end
  end
  describe '.clear' do
    it 'empties out the all_terms array' do
      Term.create("zebra", "a striped horse")
      Term.clear
      Term.all.should eq []
    end
  end

  describe '#edit_definition' do
    it "edits a terms definition" do
      test_term = Term.create('Doe', "A Fox")
      test_term.edit_definition('A deer', 0)
      test_term.definition.should eq ["A deer"]
    end
  end
  describe '.find_index' do
    it 'finds the index of the term' do
      test_word1 = Word.create("Zebra", "English")
      test_term1 = Term.create(test_word1, "a striped horse")
      test_word2 = Word.create("doe", "English")
      test_term2 = Term.create(test_word2, "a deer, a female deer")
      # test_term2.multi_words("animal")
      Term.find_index("Zebra").should eq 0
    end
  end
  describe '.search' do
    it 'find the term when word is entered' do
      test_word1 = Word.create("zebra", "English")
      test_term1 = Term.create(test_word1, "a striped horse")
      test_word2 = Word.create("doe", "English")
      test_term2 = Term.create(test_word2, "a deer, a female deer")
      # test_term2.multi_words("animal")
      Term.search("doe").should eq test_term2
    end
  end
  describe '#multi_definitions' do
    it 'will add a definition to an already existing word' do
      test_term = Term.create("Zebra", 'A striped horse')
      test_term.multi_definitions("Lion lunch")
      test_term.definition.should eq ["A striped horse", "Lion lunch"]
    end
  end

  # describe '#multi_words' do
  #   it 'will add a word to an already existing term' do
  #     test_term = Term.create("Zebra", 'A striped horse')
  #     test_term.multi_words("Broken Horse")
  #     test_term.word.should eq ["Zebra", "Broken Horse"]
  #   end
  # end

end
