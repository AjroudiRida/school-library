require_relative 'book'
require_relative 'classroom'
require_relative 'person'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'
require_relative 'validate_input'
require_relative 'store_data'
require_relative 'load_data'
require 'json'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = load_books
    @people = load_people
    @rentals = load_rentals
  end

  def list_books(*)
    puts 'Library is empty' if @books.empty?
    @books.each_with_index do |book, i|
      puts "#{i + 1} | Book: #{book.title} | Author: #{book.author}"
    end
  end

  def list_people(*)
    puts 'No person is registered' if @people.empty?
    @people.each_with_index do |per, i|
      if per.is_a?(Student)
        puts "#{i + 1} [Student] ID: #{per.id} Name: #{per.name} Age: #{per.age} classroom: #{per.classroom}"
      elsif per.is_a?(Teacher)
        puts "#{i + 1} [Teacher] ID: #{per.id} Name: #{per.name} Age: #{per.age} specialization: #{per.specialization}"
      end
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [input the number]: '
    student_or_teacher = user_input('int')
    case student_or_teacher
    when 1
      create_student
    when 2
      create_teacher
    else
      puts "Invalid choice. Please enter a valid option. (#{student_or_teacher})"
    end
  end

  def create_student
    print 'Age: '
    age = user_input('str')

    print 'Name: '
    name = user_input('str')

    print 'Classroom: '
    classroom = user_input('str')

    print 'Has parent permission? [Y / N]: '
    parent_permission = user_input('str')

    if parent_permission =~ /^[Yy]/
      student = Student.new(classroom, age, name, parent_permission: parent_permission)
    else
      puts "Invalid choice. Please enter a valid option. (#{parent_permission})"
      return
    end

    @people.push(student)
    puts 'Person created successfully'
  end

  def create_teacher
    print 'Age: '
    age = user_input('str')

    print 'Name: '
    name = user_input('str')

    print 'Specialization: '
    specialization = user_input('str')

    teacher = Teacher.new(specialization, age, name)
    @people.push(teacher)
    puts 'Person created successfully'
  end

  def create_book
    print 'Title: '
    title = user_input('str')

    print 'Author: '
    author = user_input('str')

    @books.push(Book.new(title, author))
    puts 'Book created successfully'
  end

  def create_rental
    if @books.empty?
      puts 'Please create a book first.'
    elsif @people.empty?
      puts 'Please create a person first.'
    else

      list_books(with_index: true)
      print "Enter book's index: "
      book_index = user_input('int')
      book_index -= 1
      book = @books[book_index]
      list_people(with_index: true)
      print "Enter person's index: "
      person_index = user_input('int')
      person_index -= 1
      person = @people[person_index]
      print 'Date: '
      date = user_input('str')
      @rentals.push(Rental.new(date, person, book))
      puts 'Rental created successfully'
    end
  end

  def list_rentals
    print 'ID of person: '
    id = user_input('int')
    selected = @rentals.find_all { |rental| rental.person.id == id }
    if selected.empty?
      puts "Person with given id #{id} does not exist"
      return
    end
    puts 'Rentals:'
    selected.map { |rental| puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}" }
  end

  def exist_app
    store_books(@books)
    store_people(@people)
    store_rentals(@rentals)
  end

  def run
    main
  end
end
