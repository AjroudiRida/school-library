require_relative '../teacher'
require 'rspec'

describe Teacher do
  let(:teacher) { Teacher.new('Math', 30, 'Bob', false) }

  describe '#initialize' do
    it 'sets the specialization parameter to the Teacher class' do
      expect(teacher.specialization).to eq('Math')
    end

    it 'sets the age parameter to the Teacher class' do
      expect(teacher.age).to eq(30)
    end

    it 'sets the name parameter to the Teacher class' do
      expect(teacher.name).to eq('Bob')
    end

    it 'sets the parent_permission parameter to the Teacher class' do
      expect(teacher.parent_permission).to eq(false)
    end
  end

  describe '#can_use_services?' do
    it 'returns true for any teacher' do
      expect(teacher.can_use_services?).to eq(true)
    end
  end
end
