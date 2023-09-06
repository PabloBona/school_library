require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'classroom'
require_relative 'teacher'
require_relative 'student'
require_relative 'person'
require_relative 'rental'
require_relative 'book'
require 'json'

class App
  def initialize
    @books = []
    @persons = []
    @rentals = []
    data_from_json
  end

  def list_all_books
    @books
  end

  def create_a_book(title, author)
    @books.push(Book.new(title, author))
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

  def create_a_rental(date, book_id, person_id)
    @rentals.push(Rental.new(date, @persons[person_id], @books[book_id]))
  end

  def list_rental_person(id)
    person = @persons.find { |p| p.id == id }
    person&.rentals || []
  end

  def save_data_to_json
    save_books_to_json
    save_people_to_json
    save_rentals_to_json
  end

  def data_from_json
    books_from_json
    people_from_json
    rentals_from_json
  end

  def exit_app
    save_data_to_json
    create_empty_json_file('./data/books.json') unless File.exist?('./data/books.json')
    create_empty_json_file('./data/people.json') unless File.exist?('./data/people.json')
    create_empty_json_file('./data/rentals.json') unless File.exist?('./data/rentals.json')
    puts 'Exiting the application.'
  end

  def save_people_to_json
    people_data = @persons.map do |person|
      if person.is_a?(Teacher)
        {
          'type' => 'Teacher',
          'name' => person.name,
          'age' => person.age,
          'specialization' => person.specialization,
          'parent_permission' => person.parent_permission
        }
      else
        {
          'type' => 'Student',
          'name' => person.name,
          'age' => person.age,
          'parent_permission' => person.parent_permission
        }
      end
    end

    File.write('./data/people.json', JSON.pretty_generate(people_data))
  end

  def save_books_to_json
    books_data = @books.map do |book|
      {
        'title' => book.title,
        'author' => book.author
      }
    end

    File.write('./data/books.json', JSON.pretty_generate(books_data))
  end

  def books_from_json
    if File.exist?('./data/books.json')
      books_data = JSON.parse(File.read('./data/books.json'))
      @books = books_data.map { |data| Book.new(data['title'], data['author']) }
    else
      @books = []
    end
  end

  def people_from_json
    if File.exist?('./data/people.json')
      people_data = JSON.parse(File.read('./data/people.json'))
      @persons = people_data.map do |data|
        if data['type'] == 'Teacher'
          create_teacher_from_data(data)
        else
          create_student_from_data(data)
        end
      end
    else
      @persons = []
    end
  end

  def create_teacher_from_data(data)
    id = (data['id'] || rand(0..999)).to_i
    Teacher.new(
      data['age'],
      data['specialization'],
      data['name'],
      parent_permission: data['parent_permission'],
      id: id
    )
  end

  def create_student_from_data(data)
    id = (data['id'] || rand(0..999)).to_i
    student_name = data['name']
    student_age = data['age']
    student_permission = data['parent_permission']
    classroom = nil

    Student.new(
      student_age,
      classroom,
      student_name,
      parent_permission: student_permission,
      id: id
    )
  end

  def save_rentals_to_json
    rentals_data = @rentals.map do |rental|
      {
        'Date' => rental.date,
        'book_index' => @books.index(rental.book),
        'person_index' => @persons.index(rental.person)
      }
    end
    File.write('./data/rentals.json', JSON.pretty_generate(rentals_data))
  end

  def rentals_from_json
    if File.exist?('./data/rentals.json')
      rentals_data = JSON.parse(File.read('./data/rentals.json'))

      @rentals = rentals_data.map do |data|
        date = data['Date']
        book_index = data['book_index']
        person_index = data['person_index']
        Rental.new(date, @persons[person_index], @books[book_index])
      end
    else
      @rentals = []
    end
  end

  def create_empty_json_file(file_path)
    File.write(file_path, '[]')
  end
end
