require "create_book"

require "create_person"

require "list_books"

require "list_people"

require "list_rental_by_id"

require "create_rental"

require "switch"

require "./lib/storeData"

puts "Welcome to School Library"

puts "Please choose an option by entering a number:"

class App
  attr_reader :books, :people, :rentals

  def initialize(list_options)
    @books = []

    @people = []

    @rentals = []

    @list_options = list_options
  end

  def run
    @list_options.each do |option|
      puts option.center(50, "-")
    end

    choice = gets.chomp.to_i

    case choice

    when 1, 2, 3
      switch(choice)
    when 4, 5, 6, 7
      switch_rental(choice)
    end
  end
end
