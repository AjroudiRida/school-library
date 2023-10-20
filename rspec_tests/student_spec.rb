require_relative '../student'
require_relative '../classroom'
require 'rspec'

describe Student do
  let(:classroom) { Classroom.new('Math') }
  let(:student) { Student.new(classroom, 20, 'Alice', true) }

  describe '#initialize' do
    it 'sets the classroom parameter to the Student class' do
      expect(student.classroom).to eq(classroom)
    end

    it 'sets the age parameter to the Student class' do
      expect(student.age).to eq(20)
    end

    it 'sets the name parameter to the Student class' do
      expect(student.name).to eq('Alice')
    end
  end

  describe '#classroom=' do
    it 'assigns the student object to a different classroom' do
      new_classroom = Classroom.new('History')
      student.classroom = new_classroom
      expect(student.classroom).to eq(new_classroom)
      expect(new_classroom.students).to include(student)
    end
  end

  describe '#play_hooky' do
    it 'returns a funny string' do
      expect(student.play_hooky).to eq('¯(ツ)/¯')
    end
  end
end
