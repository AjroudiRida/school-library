# File: spec/person_spec.rb
require_relative '../person'
require_relative '../rental'
require_relative '../book'
require 'rspec'
require 'date'

describe Person do
  # Use let to define variables that are lazily evaluated
  let(:person) { Person.new(25, 'Alice', false) }
  let(:book) { Book.new('book title', 'book author') }

  describe '#initialize' do
    it 'sets the age parameter to the Person class' do
      expect(person.age).to eq(25)
    end

    it 'sets the name parameter to the Person class' do
      expect(person.name).to eq('Alice')
    end

    it 'sets the parent_permission parameter to the Person class' do
      expect(person.parent_permission).to eq(false)
    end

    it 'generates a random id for the person' do
      expect(person.id).to be_a(Integer)
      expect(person.id).to be_between(1, 1000)
    end

    it 'initializes an empty array of rentals for the person' do
      expect(person.rentals).to be_empty
    end
  end

  describe '#of_age?' do
    it 'returns true if the person is 18 or older' do
      expect(person.send(:of_age?)).to eq(true)
    end

    it 'returns false if the person is younger than 18' do
      young_person = Person.new(17, 'Bob', true)
      expect(young_person.send(:of_age?)).to eq(false)
    end
  end

  describe '#can_use_services?' do
    it 'returns true if the person is of age or has parent permission' do
      expect(person.can_use_services?).to eq(true)
    end

    it 'returns false if the person is not of age and has no parent permission' do
      young_person = Person.new(16, 'Charlie', false)
      expect(young_person.can_use_services?).to eq(false)
    end
  end

  describe '#correct_name' do
    it 'returns the name of the person' do
      expect(person.correct_name).to eq('Alice')
    end
  end

  describe '#add_rental' do
    it 'creates a new rental with the given date and book' do
      rental = person.add_rental(Date.today, book)

      expect(rental).to be_a(Rental)
      expect(rental.date).to eq(Date.today)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
    end

    it "adds the new rental to the person's rentals array" do
      rental = person.add_rental(Date.today, book)

      expect(person.rentals).to include(rental)
    end
  end
end
