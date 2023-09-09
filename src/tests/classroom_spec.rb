require_relative '../classroom'
require_relative '../student'

describe Classroom do
  before :each do
    @classroom = Classroom.new('B103')
    @student = Student.new(20, 'Alice Johnson', parent_permission: true)
  end

  describe '#new' do
    it 'creates a new classroom object' do
      expect(@classroom).to be_an_instance_of Classroom
    end
  end

  describe '#label' do
    it 'returns the classroom label' do
      expect(@classroom.label).to eql 'B103'
    end
  end

  describe '#students' do
    it 'starts with an empty students array' do
      expect(@classroom.students).to eql([])
    end
  end

  describe '#add_student' do
    it 'adds a student to the classroom' do
      @classroom.add_student(@student)
      expect(@classroom.students).to eql([@student])
    end
  end
end
