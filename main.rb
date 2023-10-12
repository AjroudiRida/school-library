# main.rb

require './person'
require './book'
require './rental'
require './student'
require './classroom'

person = Person.new(22, 'maximilianus')
puts person.correct_name

book = Book.new('book title', 'rida')
puts book.title

rental = Rental.new('2023-12-22', book, person)
puts rental.date

student = Student.new('2a', 19, 'yassin')
classroom = Classroom.new('2a')
classroom.add_student(student)
puts classroom
