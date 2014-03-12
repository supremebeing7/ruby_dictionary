class Term

  @@all_terms = []

  def initialize(word, definition)
    @word = []
    @word << word
    @definition = []
    @definition << definition

  end

  def word
    @word
  end

  def edit_word(edited_word, index)
    @word[index] = edited_word
  end

  def multi_words(new_word)
    @word << new_word
  end

  def definition
    @definition
  end

  def edit_definition(edited_definition, index)
    @definition[index] = edited_definition
  end

  def multi_definitions(new_definition)
    @definition << new_definition
  end

  def Term.create(word, definition)
    new_term = Term.new(word, definition)
    @@all_terms << new_term
    new_term
  end

  def Term.all
    @@all_terms
  end

  def Term.clear
    @@all_terms = []
  end

  def Term.find_index(input)
    Term.all.each_with_index do |term, index|
      found_word = term.word
      0.upto(found_word.length) do | loop_index |
        if found_word[loop_index] == input
          return index
        end
      end
    end
  end

  def find_word_index(input, index)  #Unsure if working
    Term.all[index].word.each_with_index do |wrd, indx|
      if wrd == input
        return indx
      end
    end
  end

  def Term.search(input)
    Term.all[Term.find_index(input)]
  end
end
