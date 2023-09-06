require 'json'
require_relative '../person'
require_relative '../book'
require_relative '../rental'
require_relative '../teacher'
require_relative '../student'

describe 'Book' do
  before :each do
    @book = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')
  end

  describe '#new' do
    it 'should create a new book instance' do
      expect(@book).to be_an_instance_of Book
    end
  end

  describe '#title' do
    it 'should return the book title' do
      expect(@book.title).to eql 'The Great Gatsby'
    end
  end

  describe '#author' do
    it 'should return the book author' do
      expect(@book.author).to eql 'F. Scott Fitzgerald'
    end
  end

  describe '#rentals' do
    it 'should have an empty rentals array initially' do
      expect(@book.rentals).to eql([])
    end
  end
end
