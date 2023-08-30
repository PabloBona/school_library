class Rental
  attr_accessor :date, :person, :book

  def initialize(date, person, book)
    @date = date
    @person = person
    @book = book

    person.add_rental(self)
    book.add_rental(self)
  end
end
