require './lib/term.rb'
require './lib/word.rb'

def main_menu
  puts "\n\n\n\n\tWelcome to Dictionary\n"
  puts "A - Add a word, language and a definition"
  if Term.all.length > 0
    puts "L - List your terms"
    puts "S - Search for terms"
  end
  puts "X - Exit Dictionary"

  option = gets.chomp.upcase

  case option
    when "A"
      add_term
    when "L"
      if Term.all.length > 0
        list_terms
      else
        puts "No terms to list, please add one."
        add_term
      end
    when "S"
      if Term.all.length > 0
        search_terms
      else
        puts "No terms to search, please add one."
        add_term
      end
    when "X"
      puts "Thanks for using Dictionary."
  else
    puts "Invalid input, suckah!\n\n"
    main_menu
  end
end

def add_term
  puts "Please enter a term you wish to define"
  new_word = gets.chomp.capitalize
  puts "Please enter the language"
  new_language = gets.chomp.capitalize
  puts "please enter your definition for your term"
  new_definition = gets.chomp.capitalize
  Term.create(Word.create(new_word, new_language), new_definition)
  puts "Added: #{Term.all.last.word.word} (#{Term.all.last.word.language}): #{Term.all.last.definition}"
  main_menu
end

def list_terms
  Term.all.each_with_index do |term, index|
    puts "#{index + 1}. #{term.word.word} (#{term.word.language}) - #{term.definition}\n"
  end
  puts "E - Edit a term"
  puts "A - Add a new term"
  puts "M - Main Menu"
  option = gets.chomp.upcase
  case option
  when "E"
    edit_term
  when "A"
    add_term
  when "M"
    main_menu
  else
    puts "Invalid input, fool!"
  end
end
def edit_term
  puts "Type a word to edit the word or definition"
  term_index = Term.find_index(gets.chomp.capitalize)
  puts term_index
  puts "AD - Add a definition to a word"
  puts "AW - Add an additional word"
  puts "W - To edit Word"
  puts "D - To edit Definition"
  puts "DEL - To delete the word from Dictionary"
  option = gets.chomp.upcase
  case option
  when "AD"
    add_definition(term_index)
  when "AW"
    add_word(term_index)
  when "W"
    edit_word(term_index)
  when "D"
    edit_definition(term_index)
  when "DEL"
    delete_term(term_index)
  else
    puts "Invalid entry, idiot!"
    edit_term
  end
end

def delete_term(term_index)
  puts "Are you sure? (Yes/No)"
  option2 = gets.chomp.capitalize
  case option2
  when "Yes"
    puts "#{Term.all[term_index].word.word} deleted!"
    Term.all.delete_at(term_index)
  when "No"
    edit_term
  else
    puts "Not a valid input"
  end
  main_menu
end

def search_terms
  puts "Type the word you would like to search"
  found_term = Term.search(gets.chomp.capitalize)
  puts "#{found_term.word.word} (#{found_term.word.language}) - #{found_term.definition}\n"
  main_menu
end

def add_word(term_index)
  puts "Enter word to add an additional word"
  new_word = gets.chomp.capitalize
  puts "Enter the language of the new word"
  new_lang = gets.chomp.capitalize
  Term.all[term_index].word.add_words(new_word, new_lang)
  print "array with two objects? #{Term.all[term_index].word}"
  puts "Added #{Term.all[term_index].word.word} to #{Term.all[term_index].word.word}"
  main_menu
end

def add_definition(term_index)
  puts "Enter definition to add to word"
  Term.all[term_index].add_definitions(gets.chomp.capitalize)
  puts "Added #{Term.all[term_index].definition.last} to #{Term.all[term_index].word.word}"
  main_menu
end

def edit_word(term_index)
  # word_index = 0
  # THIS SECTION FOR MULTIPLE WORDS - NOT WORKING -
  # word_count = Term.all[term_index].word.Word.all.length
  # if word_count > 1
  #   puts "choose a word to edit 1 to #{word_count}"
  #   word_index = gets.chomp.to_i-1
  # end
  puts "Type the word edit"
  edited_word = gets.chomp.capitalize
  Term.all[term_index].word.edit_word(edited_word)
  puts "Updated! #{Term.all[term_index].word.word} (#{Term.all[term_index].word.language} - #{Term.all[term_index].definition}\n"
  main_menu
end

def edit_definition(term_index)
  def_index = 0
  def_count = Term.all[term_index].definition.length
  if def_count > 1
    puts "choose a definition to edit 1 to #{def_count}"
    def_index = gets.chomp.to_i-1
  end
  puts "Type the definition edit"
  edited_definition = gets.chomp.capitalize
  Term.all[term_index].edit_definition(edited_definition, def_index)
  puts "Updated! #{Term.all[term_index].word} - #{Term.all[term_index].definition}\n"
  main_menu
end

main_menu
