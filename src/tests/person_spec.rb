require_relative '../person'
require_relative '../nameable'
require_relative '../book'
require_relative '../rental'
require 'rspec'

describe Person do
  before :each do
    @person = Person.new(20, 'Alice Johnson', parent_permission: true)
    @book = Book.new('To Kill a Mockingbird', 'Harper Lee')
    @date = '2023-09-06'
  end

  describe '#new' do
    it 'creates a new person object' do
      expect(@person).to be_an_instance_of Person
    end
  end

  describe '#name' do
    it 'returns the person\'s name' do
      expect(@person.name).to eql 'Alice Johnson'
    end
  end

  describe '#age' do
    it 'returns the person\'s age' do
      expect(@person.age).to eql 20
    end
  end

  describe '#rentals' do
    it 'starts with an empty rentals array' do
      expect(@person.rentals).to eql([])
    end
  end

  describe '#can_use_services?' do
    context 'when the person is of age' do
      it 'allows using services' do
        @person.age = 18
        expect(@person.can_use_services?).to eq(true)
      end
    end

    context 'when the person is not of age but has parent permission' do
      it 'allows using services' do
        @person.age = 16
        expect(@person.can_use_services?).to eq(true)
      end
    end

    context 'when the person is not of age and lacks parent permission' do
      it 'does not allow using services' do
        @person.age = 16
        @person.parent_permission = false
        expect(@person.can_use_services?).to eq(false)
      end
    end
  end

  describe '#add_rental' do
    it 'should add a rental to the person' do
      rental = Rental.new(@date, @person, @book)
      @person.add_rental(@book, @date)
      expect(@person.rentals).to include(rental)
    end
  end
end
