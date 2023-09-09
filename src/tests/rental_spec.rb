require_relative '../rental'
require_relative '../book'
require_relative '../person'

describe Rental do
  before :each do
    @book = Book.new('To Kill a Mockingbird', 'Harper Lee')
    @person = Person.new(20, 'Alice Johnson', parent_permission: true)
    @date = '2023-09-06'
    @rental = Rental.new(@date, @person, @book)
  end

  describe '#new' do
    it 'creates a new rental object' do
      expect(@rental).to be_an_instance_of Rental
    end
  end

  describe '#book' do
    it 'returns the book object' do
      expect(@rental.book).to eql @book
    end
  end

  describe '#person' do
    it 'returns the person object' do
      expect(@rental.person).to eql @person
    end
  end

  describe '#date' do
    it 'returns the date' do
      expect(@rental.date).to eql @date
    end
  end
end
