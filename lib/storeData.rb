require_relative '../book'

require_relative '../person'

require_relative '../student'

require_relative '../teacher'

require 'json'

def load_books
  if File.exist?('./lib/books.json')

    file = File.open('./lib/books.json')

    if file.size.zero? # rubocop:disable Style/ZeroLengthPredicate

      'Please add  books first if this is your fist time using our app'

    else

      books = JSON.parse(File.read('./lib/books.json'))

      books.each do |book|
        book = Book.new(book['title'], book['author'])

        @books << book
      end

    end

    file.close

  else

    p 'Please add  books first'

  end

  p 'Available books:'

  @books.each { |b| p "Book title: #{b.title}, Author: #{b.author}" } unless @books.empty?
end

def save_book(title, author)
  obj = {

    title: title,

    author: author

  }

  return unless File.exist?('./lib/books.json')

  file = File.open('./lib/books.json')

  if file.empty?

    book = [obj]

  else

    book = JSON.parse(File.read('./lib/books.json'))

    book << obj

  end

  file.close

  myfile = File.open('./lib/books.json', 'w')

  myfile.write(JSON.pretty_generate(book))

  myfile.close
end

def load_people
  if File.exist?('./lib/people.json')

    file = File.open('./lib/people.json')

    if File.empty?('./lib/people.json')

      p 'Please add people data '

    else

      people = JSON.parse(File.read('./lib/people.json'))

      people.each do |person|
        if person['option'] == 'Student'

          student = Student.new(person['age'], person['name'])

          @people << student

        else

          teacher = Teacher.new(person['specialization'], person['age'], person['name'])

          @people << teacher

        end
      end

    end

    file.close

  else

    p 'Please insert  data'

  end
end

def save_student(name, age, parent_permission)
  obj = {

    type: 'Student',

    name: name,

    age: age,

    parent_permission: parent_permission

  }

  return unless File.exist?('./lib/people.json')

  file = File.open('./lib/people.json')

  if file.size.zero? # rubocop:disable Style/ZeroLengthPredicate

    student = [obj]

  else

    student = JSON.parse(File.read('./lib/people.json'))

    student << obj

  end

  file.close

  myfile = File.open('./lib/people.json', 'w')

  myfile.write(JSON.pretty_generate(student))

  myfile.close
end

def save_teacher(name, age, specialization)
  obj = {

    type: 'Teacher',

    specialization: specialization,

    name: name,

    age: age,

    parent_permission: true

  }

  return unless File.exist?('./lib/people.json')

  file = File.open('./lib/people.json')

  if file.size.zero? # rubocop:disable Style/ZeroLengthPredicate

    teacher = [obj]

  else

    teacher = JSON.parse(File.read('./lib/people.json'))

    teacher << obj

  end

  file.close

  myfile = File.open('./lib/people.json', 'w')

  myfile.write(JSON.pretty_generate(teacher))

  myfile.close
end

def load_rentals
  if File.exist?('./lib/rentals.json')

    file = File.open('./lib/rentals.json')

    if file.size.zero? # rubocop:disable Style/ZeroLengthPredicate

      p 'Please add reseve  books first'

    else

      rentals = JSON.parse(File.read('./lib/rentals.json'))

      p 'Reserved books: '

      rentals.each do |rental|
        p "Name: #{rental['person']}, Book: #{rental['book']} on: #{rental['date']}"
      end

    end

    file.close

  else

    p 'No reservations found, please reseve  books first'

  end
end

def save_rental(date, book, person)
  obj = {

    date: date,
    book: book.title,
    person: person.name
  }

  return unless File.exist?('./lib/rentals.json')

  file = File.open('./lib/rentals.json')

  if file.empty?

    rental = [obj]

  else

    rental = JSON.parse(File.read('./lib/rentals.json'))

    rental << obj

  end

  file.close

  myfile = File.open('./lib/rentals.json', 'w')

  myfile.write(JSON.pretty_generate(rental))

  myfile.close
end