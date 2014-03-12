require 'rspec'
require 'term'

describe Term do
  before do
    Term.clear
  end

  it 'initializes an instance of the Term class' do
    test_term = Term.new("zebra", "A striped horse")
    test_term.should be_an_instance_of Term
  end
  it 'initializes with an instance of word' do
    test_term = Term.new("Zebra", "A striped horse")
    test_term.word.should eq ['Zebra']
  end
  it 'initializes with an instance of definition' do
    test_term = Term.new("Zebra", "A striped horse")
    test_term.definition.should eq ["A striped horse"]
  end

  describe '.create' do
    it 'creates a new initialized instance of Term' do
      test_term = Term.create("zebra", "a striped horse")
      test_term.word.should eq ["zebra"]
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
  describe '#edit_word' do
    it 'edits a terms word' do
      test_term = Term.create("ZZebra", "A striped horse")
      test_term.edit_word("Zebra", 0)
      test_term.word.should eq ["Zebra"]
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
      test_term1 = Term.create("zebra", "a striped horse")
      test_term2 = Term.create("doe", "a deer, a female deer")
      test_term2.multi_words("animal")
      Term.find_index("zebra").should eq 0
    end
  end
  describe '.search' do
    it 'find the term when word is entered' do
      test_term1 = Term.create("zebra", "a striped horse")
      test_term2 = Term.create("doe", "a deer, a female deer")
      test_term2.multi_words("animal")
      Term.search("animal").should eq test_term2
    end
  end
  describe '#multi_definitions' do
    it 'will add a definition to an already existing word' do
      test_term = Term.create("Zebra", 'A striped horse')
      test_term.multi_definitions("Lion lunch")
      test_term.definition.should eq ["A striped horse", "Lion lunch"]
    end
  end

  describe '#multi_words' do
    it 'will add a word to an already existing term' do
      test_term = Term.create("Zebra", 'A striped horse')
      test_term.multi_words("Broken Horse")
      test_term.word.should eq ["Zebra", "Broken Horse"]
    end
  end
  describe "#find_word_index" do
    it "will find the index of the word array" do
      test_term = Term.create("Zebra", "A striped horse")
      test_term.multi_words('Black n white horse')
      test_term.find_word_index('Black n white horse', 0).should eq 1
    end
  end
end
