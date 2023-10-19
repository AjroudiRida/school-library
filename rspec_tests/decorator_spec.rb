require_relative '../person'
require_relative '../decorator'

describe Decorator do
  context 'When testing Person class' do
    it 'Check the result of correct_name method' do
      @person = Person.new(24, 'this is some text')
      expect(@person.correct_name).to eql('this is some text')
    end
  end
end
