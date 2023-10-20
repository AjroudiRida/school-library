require_relative '../book'
require_relative '../rental'
require_relative '../person'

describe Book do
  before(:each) do
    @book = Book.new('book title', 'book author')
  end

  context 'When testing the Book class' do
    it 'sets the title parameter to the Book class' do
      expect(@book.title).to eq('book title')
    end

    it 'sets the author parameter to the Book class' do
      expect(@book.author).to eq('book author')
    end

    it 'initializes rentals array' do
      expect(@book.rentals).to be_empty
    end
  end
end
