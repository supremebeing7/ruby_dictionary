class Term

  @@all_terms = []

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
      found_word = term.word.word
      if found_word == input
        return index
      end
      # breaks with more than one word, old loop w/o word class
      # 0.upto(found_word.length) do | loop_index |
      #   if found_word[loop_index] == input
      #     return index
    end
  end

  def Term.search(input)
    Term.all[Term.find_index(input)]
  end

  def initialize(word, definition)
    @word = []
    @word << word
    @definition = []
    @definition << definition

  end

  def word
    @word
  end

  # def edit_word(edited_word, index)
  #   @word[index] = edited_word
  # end

  # def add_words(new_word)
  #   @word << new_word
  # end

  def definition
    @definition
  end

  def edit_definition(edited_definition, index)
    @definition[index] = edited_definition
  end

  def add_definitions(new_definition)
    @definition << new_definition
  end




end


