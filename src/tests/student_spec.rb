require_relative '../student'

describe Student do
  student = Student.new(12, nil, 'Mahdi', parent_permission: false, id: 110)

  describe '#initialize' do
    it 'Student name is Mahdi"' do
      expect(student.name).to eq('Mahdi')
    end

    it 'Age of student is 12' do
      expect(student.age).to eq(12)
    end

    it 'Id of student is 110' do
      expect(student.id).to eq(110)
    end

    it 'Student doesn\'t have parent permission' do
      expect(student.parent_permission).to eq(false)
    end

    it 'Student has a list of rentals' do
      expect(student.rentals).to be_an(Array)
    end

    it 'Student currently does not have any rental on his collection' do
      expect(student.rentals).to be_empty
    end
  end

  describe '#correct_name' do
    it 'The correct name of the Student should be "Mahdi"' do
      expect(student.correct_name).to eq('Mahdi')
    end
  end

  describe '#can_use_services?' do
    it 'Student can not use from services.' do
      expect(student.can_use_services?).to eq(false)
    end
  end

  describe '#play_hooky' do
    it 'The retun valud of play_hooky method should be "¯\\(ツ)/¯"' do
      expect(student.play_hooky).to eq('¯\\(ツ)/¯')
    end
  end
end
