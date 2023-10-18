require 'json'

def load_books
  books = []
  # return books unless File.exist?('books.json')
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
  return people if File.empty?('people.json')

  peopledata = File.read('people.json')
  peoplearray = JSON.parse(peopledata)
  peoplearray.each do |person|
    if person['class'] == 'student'
      people << Student.new(person['classroom'], person['age'], person['name'], person['id'])
    elsif person['class'] == 'teacher'
      people << Teacher.new(person['specialization'], person['age'], person['name'], person['id'])
    end
  end
  people
end


def load_rentals
  rentals = []
  return rentals if File.empty?('rentals.json')

  file_content = File.read('rentals.json')
  rentalsArray = JSON.parse(file_content)

  rentalsArray.each do |rental|
    person_id = rental['person']
    if @people
      person = @people.select { |pers| pers.id == person_id }
      rentals << Rental.new(rental['date'], person[0], rental['book'])
    end
  end
  rentals
end
