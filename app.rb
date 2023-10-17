require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def book_list
    if @books.empty?
      puts 'There is no books'
    else
      puts "There are #{@books.length} books:"
      @books.each do |book|
        puts "Title: #{book.title}, Author: #{book.author}"
      end
    end
  end

  def create_a_book
    puts 'Enter the book title:'
    title = gets.chomp
    puts 'Enter the book author:'
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts 'book created!'
  end

  def people_list
    if @people.empty?
      puts 'There is no person'
    else
      puts "There is #{@people.length} person:"
      @people.each do |person|
        puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def create_a_person
    print 'Do you want to create a Student (1) or a Teacher (2)? [Input the number]: '
    option = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    case option
    when '1'
      print 'Has parent permission? [Y/N]: '
      permission = gets.chomp.downcase
      @people << Student.new(age, name, parent_permission: (permission == 'y'))
    when '2'
      print 'Specialization: '
      specialization = gets.chomp
      @people << Teacher.new(age, specialization, name)
    end
    puts 'Person Created Successfully'
  end

  def select_book
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, i|
      puts "#{i}) Title: #{book.title}, Author: #{book.author}"
    end
    option = gets.chomp.to_i
    @books[option]
  end

  def select_person
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, i|
      puts "#{i}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    option = gets.chomp.to_i
    @people[option]
  end

  def create_a_rental
    if @books.empty? || @people.empty?
      puts 'There is no books or people'
    else
      book = select_book
      person = select_person
      puts 'Date:'
      date = gets.chomp
      rental = Rental.new(date, book, person)
      @rentals << rental
      puts 'Rental created successfully'
    end
  end

  def list_all_rentals_for_person_id
    puts 'ID of person:'
    id = gets.chomp.to_i
    person_rentals = []
    @rentals.each do |rental|
      person_rentals << rental if rental.person.id == id
    end
    puts 'Rentals:'
    person_rentals.each do |rental|
      puts "Date #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}"
    end
  end
end
