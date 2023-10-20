require_relative '../trimmer_decorator'
require_relative '../decorator'

describe TrimmerDecorator do
  before(:each) do
    @trimmer = TrimmerDecorator.new('Afghanistan')
  end

  it 'should validate validate_name method' do
    expect(@trimmer.correct_name('Afghanistan')).to eq 'Afghanista'
  end
end
