require_relative '../rental'
require_relative '../book'
require_relative '../person'

describe Rental do
  let(:date) { '2023-10-10' }
  let(:person) { Person.new('Ahmad') }
  let(:book) { Book.new('New book Title', 'Book ABC') }
  let(:rental) { Rental.new(date, person, book) }

  context 'When testing Rental class' do
    it 'sets the date, person, and book' do
      expect(rental.date).to eq(date)
      expect(rental.person).to eq(person)
      expect(rental.book).to eq(book)
    end

    it 'The rental date should exist ' do
      expect(rental.date).to eq(date)
    end

    it 'The persone name should exist ' do
      expect(rental.person).to eq(person)
    end

    it 'the book title should exists' do
      expect(rental.book).to eq(book)
    end

    it 'adds the rental to the person and book' do
      expect(person.rentals).to include(rental)
      expect(book.rentals).to include(rental)
    end
  end
end
