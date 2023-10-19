require 'json'

def load_books
  books = []
  return books unless File.exist?('books.json')
  return books if File.empty?('books.json')

  file_content = File.read('books.json')
  booksarray = JSON.parse(file_content)

  booksarray.each do |book|
    books << Book.new(book['title'], book['author'])
  end
  books
end

def load_people
  people = []
  return people unless File.exist?('people.json')
  return people if File.empty?('people.json')

  peopledata = File.read('people.json')
  peoplearray = JSON.parse(peopledata)
  peoplearray.each do |person|
    if person['class'] == 'student'
      student = Student.new(person['classroom'], person['age'], person['name'])
      student.id = person['id']
      people << student
    elsif person['class'] == 'teacher'
      teacher = Teacher.new(person['specialization'], person['age'], person['name'])
      teacher.id = person['id']
      people << teacher
    end
  end
  people
end

def load_rentals
  rentals = []
  return rentals unless File.exist?('rentals.json')
  return rentals if File.empty?('rentals.json')

  rentalsdata = File.read('rentals.json')
  rentalsarray = JSON.parse(rentalsdata)
  load_people
  # peoples.each do |people|
  #   puts people.id
  # end
  rentalsarray.each do |rental|
    person_info = load_people.find do |person|
      person.id == rental['person']
    end
    book_info = load_books.find { |book| book.title == rental['book'] }

    if person_info && book_info
      rentals << Rental.new(rental['date'], person_info, book_info)
    else
      puts "Unable to find person or book for rental: #{rental}"
    end
  end
  rentals
end
