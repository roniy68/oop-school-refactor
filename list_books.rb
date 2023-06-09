# Description: Load & List all books in the library

require './list_items'
require 'json'

class ListBooks < List
  def list(books)
    if books.empty?
      puts 'No books found'
    else
      books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
    end
  end
end
