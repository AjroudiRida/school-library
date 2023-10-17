require_relative 'book'
require_relative 'classroom'
require_relative 'person'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @rentals = []
    @people = []
  end

  def list_books(*)
    puts 'Library is empty' if @books.empty?
    @books.each_with_index do |book, i|
      puts "#{i + 1} | Book: #{book.title} | Author: #{book.author}"
    end
  end

  def list_people(*)
    puts 'No person is registered' if @people.empty?
    @people.each_with_index do |person, i|
      if person.is_a?(Student)
        puts "#{i + 1} [Student] ID: #{person.id} | Name: #{person.name} | Age: #{person.age}"
      elsif person.is_a?(Teacher)
        puts "#{i + 1} [Teacher] ID: #{person.id} | Name: #{person.name} | Age: #{person.age}"
      end
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [input the number]: '
    student_or_teacher = gets.chomp.to_i
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
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp.to_s

    print 'Has parent permission? [Y / N]: '
    parent_permission = gets.chomp.to_s

    if parent_permission =~ /^[Yy]/
      student = Student.new('Unknown', age, name, parent_permission: true)
    elsif parent_permission =~ /^[Nn]/
      student = Student.new('Unknown', age, name, parent_permission: false)
    else
      puts "Invalid choice. Please enter a valid option. (#{parent_permission})"
      return
    end

    @people.push(student)
    puts 'Person created successfully'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp.to_s

    print 'Specialization: '
    specialization = gets.chomp.to_s

    teacher = Teacher.new(specialization, age, name)
    @people.push(teacher)
    puts 'Person created successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp.to_s

    print 'Author: '
    author = gets.chomp.to_s

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
      book_index = gets.chomp.to_i
      book_index -= 1
      book = @books[book_index]
      list_people(with_index: true)
      print "Enter person's index: "
      person_index = gets.chomp.to_i
      person_index -= 1
      person = @people[person_index]
      print 'Date: '
      date = gets.chomp.to_s
      @rentals.push(Rental.new(date, book, person))
      puts 'Rental created successfully'
    end
  end

  def list_rentals
    print 'ID of person: '
    id = gets.chomp.to_i
    selected = @rentals.find_all { |rental| rental.person.id == id }
    if selected.empty?
      puts "Person with given id #{id} does not exist"
      return
    end
    puts 'Rentals:'
    selected.map { |rental| puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}" }
  end

  def run
    main
  end
end
