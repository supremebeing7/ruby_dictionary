class Word
  @@all_words = []

  def Word.create(input, language)
    new_word = Word.new(input, language)
    @@all_words << new_word
    new_word
  end

  def Word.all
    @@all_words
  end

  def Word.clear
    @@all_words = []
  end

  def initialize(input, language)
    @word = input
    @language = language
  end

  def word
    @word
  end

  def language
    @language
  end

  def add_words(new_word, new_lang)
    Word.create(new_word, new_lang)
  end

  def edit_word(edited_word)
    @word = edited_word
  end

  def find_word_index(input, index)
    Word.all[index].each_with_index do |wrd, indx|
      if wrd == input
        return indx
      end
    end
  end
end

