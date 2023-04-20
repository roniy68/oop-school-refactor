class Welcome
  def welcome
    puts "Welcome to School Library App!\n"
    puts '#ahroniy.me#'.center(50, '-')
    puts 'WELCOME To OOP-SCHOOL'.center(50, '*')
    puts ''.center(50, '-')
  end

  def menu
    puts 'Please choose an option by entering a number:'
    puts "\t1 - List all books"
    puts "\t2 - List all people"
    puts "\t3 - Create a person"
    puts "\t4 - Create a book"
    puts "\t5 - Create a rental"
    puts "\t6 - List all rentals for a given person id"
    puts "\t7 - Exit"
  end
end
