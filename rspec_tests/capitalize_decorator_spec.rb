require_relative '../capitalize_decorator'
require_relative '../person'

describe CapitalizeDecorator do
  context 'When testing student class' do
    before(:each) do
      @person = Person.new 25, 'ahmad jamshid'
    end

    it 'The correct_name method Should Capitalize the name ' do
      capitalize = CapitalizeDecorator.new(@person)
      @person = Person.new 25, 'ahmad jamshid'

      expect(capitalize.correct_name).to eql('Ahmad jamshid')
    end
  end
end
