require './lib/term.rb'

def main_menu
  system "clear"
  puts "\tWelcome to Dictionary\n"
  puts "A - Add a term with a definition"
  if Term.all.length > 0
    puts "L - List your terms and definitions"
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
  puts "please enter your definition for your term"
  new_definition = gets.chomp.capitalize
  Term.create(new_word, new_definition)
  puts "Added: #{Term.all.last.word}: #{Term.all.last.definition}"
  main_menu
end

def list_terms
  Term.all.each_with_index do |term, index|
    puts "#{index + 1}. #{term.word} - #{term.definition}\n"
  end
  puts "E - Edit a term"
  puts "A - Add a new term"
  puts "X - Exit Dictionary"
  option = gets.chomp.upcase
  case option
  when "E"
    edit_term
  when "A"
    add_term
  when "X"
    puts "Goodbye"
  else
    puts "Invalid input, fool!"
  end
end
def edit_term
  puts "Type a word to edit the word or definition"
  term_index = Term.find(gets.chomp.capitalize)
  puts "W - To edit Word"
  puts "D - to edit Definition"
  option = gets.chomp.upcase
  case option
  when "W"
    puts "Type the word edit"
    edited_word = gets.chomp
    Term.all[term_index].edit_word(edited_word)
    list_terms
  when "D"
    puts "Type the definition edit"
    edited_definition = gets.chomp
    Term.all[term_index].edit_definition(edited_definition)
    list_terms
  else
    puts "Invalid entry, idiot!"
    edit_term
  end
end

main_menu
