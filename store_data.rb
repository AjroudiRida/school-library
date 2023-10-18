require 'json'

def store_books(books_array)
  books = books_array.map { |book| { title: book.title, author: book.author } }
  File.write('books.json', JSON.generate(books))
end

def store_people(people_array)
  people = []

  people_array.each do |person|
    if person.is_a?(Student)
      people << { class: 'student', age: person.age, name: person.name, id: person.id, classroom: person.classroom }
    elsif person.is_a?(Teacher)
      people << { class: 'teacher', age: person.age, name: person.name, id: person.id,
                  specialization: person.specialization }
    end
  end

  people_data = JSON.generate(people)
  File.write('people.json', people_data)
end


def store_rentals(rental_array)
   rentals = rental_array.map { |rental| { date: rental.date,  person: rental.person.id , book: rental.book.title}}
   File.write('rentals.json', JSON.generate(rentals))
end
