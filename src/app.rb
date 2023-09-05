require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'classroom'
require_relative 'teacher'
require_relative 'student'
require_relative 'person'
require_relative 'rental'
require_relative 'book'

class App
  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

  def list_all_books
    @books
  end

  def list_all_persons
    @persons
  end

  def create_a_teacher(name, age, specialization)
    @persons.push(Teacher.new(age, specialization, name, parent_permission: true))
  end

  def create_a_student(name, age, parent_permission)
    @persons.push(Student.new(age, nil, name, parent_permission: parent_permission))
  end

  def create_a_book(title, author)
    @books.push(Book.new(title, author))
  end

  def create_a_rental(date, book_id, person_id)
    @rentals.push(Rental.new(date, @books[book_id], @persons[person_id]))
  end

  def list_rental_person(id)
    @persons.each do |person|
      return person.rentals if person.id == id
    end
    nil
  end
end
