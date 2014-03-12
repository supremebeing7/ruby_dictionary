class Term

  @@all_terms = []

  def initialize(word, definition)
    @word = word
    @definition = []
    @definition << definition

  end

  def word
    @word
  end

  def definition
    @definition
  end

  def edit_word(edited_word)
    @word = edited_word
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
      if found_word == input
        return index
      end
    end
  end

  def Term.search(input)
    Term.all[Term.find_index(input)]
  end
end
