require 'json'
require_relative 'person'
require_relative 'teacher'
require_relative 'student'
require_relative 'book'
require_relative 'rental'

module InputOutput
  PATH = './data/'.freeze

  def person_hash(person)
    {
      'Type' => person.class,
      'Name' => person.name,
      'ID' => person.id,
      'Age' => person.age
    }
  end

  def book_hash(book)
    {
      'Type' => book.class,
      'Title' => book.title,
      'Author' => book.author
    }
  end

  def rental_hash(rental)
    {
      'Type' => rental.class,
      'Person' => person_hash(rental.person),
      'Book' => person_hash(rental.book),
      'Date' => rental.date
    }
  end

  def generate_person(json)
    if json['Type'] == 'Teacher'
      Teacher.new(json['Age'], nil, json['Name'])
    else
      Student.new(json['Age'], nil, json['Name'])
    end
  end

  def generate_book(json)
    Book.new(json['Title'], json['Author'])
  end

  def generate_rental(json)
    Rental.new(generate_person(json['Person']), generate_book(json['Book']), json['date'])
  end

  def save_to_file(array, file_name)
    file_path = "#{PATH}#{file_name}"
    data = array.map do |element|
      case element
      when Book then book_hash(element)
      when Person then person_hash(element)
      when Rental then rental_hash(element)
      end
    end
    File.write(file_path, JSON.generate(data))
  end

  def read_file(file_name)
    file_path = "#{PATH}#{file_name}"
    file_content = JSON.parse(File.read(file_path))
    file_content.map do |obj|
      case obj['Type']
      when 'Teacher', 'Student' then generate_person(obj)
      when 'Book' then generate_book(obj)
      when 'Rental' then generate_rental(obj)
      end
    end
  end

  def start
    Dir.mkdir('data') unless File.directory?('data')
    ['people.json', 'books.json', 'rentals.json'].each do |value|
      file_path = "#{PATH}#{value}"
      File.write(file_path, []) unless File.exist?(file_path)
    end
  end
end
