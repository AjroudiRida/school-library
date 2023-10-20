require_relative '../classroom'
require_relative '../student'

describe Classroom do
  before :each do
    @classroom = Classroom.new('IT Class')
    @student = Student.new(9, name: 'student', parent_permission: false)
  end

  it 'should confirm the classroom label' do
    expect(@classroom.label).to eql('IT Class')
  end

  it 'should check the task of add_student method' do
    @classroom.add_student(@student)
    expect(@classroom.students.length).to eql(1)
  end
end
