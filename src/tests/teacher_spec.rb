require_relative '../teacher'

describe Person do
  hamid = Teacher.new(30, 'Web developer', 'Hamid', id: 555)

  describe '#initialize' do
    it 'the name of the person is "Hamid"' do
      expect(hamid.name).to eq('Hamid')
    end

    it 'The age of Hamid is 30' do
      expect(hamid.age).to eq(30)
    end

    it 'The id of hamid is 555' do
      expect(hamid.id).to eq(555)
    end

    it 'Hamid has the parent parent permission' do
      expect(hamid.parent_permission).to eq(true)
    end

    it 'Hamid is a web developer' do
      expect(hamid.specialization).to eq('Web developer')
    end

    it 'Hamid has a lits of rentals' do
      expect(hamid.rentals).to be_an(Array)
    end

    it 'He currently does not have any rental on his collection' do
      expect(hamid.rentals).to be_empty
    end
  end

  describe '#correct_name' do
    it 'The correct name of the person should be Hamid' do
      expect(hamid.correct_name).to eq('Hamid')
    end
  end

  describe '#can_use_services?' do
    it 'Hamid can use from services.' do
      expect(hamid.can_use_services?).to eq(true)
    end
  end
end
