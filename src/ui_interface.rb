require_relative 'app'

class Interface
  attr_accessor :app

  def initialize
    @app = App.new
  end

  def create_person
    loop do
      print 'Would you like to create a student (1) or a teacher (2)? [Please enter a number]: '
      option = gets.chomp.to_i

      case option
      when 1
        create_student
        break
      when 2
        create_teacher
        break
      else
        puts 'Invalid number, Try again!'
      end
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    app.create_a_book(title, author)
    puts 'Book created successfully.'
    puts
  end

  def create_a_rental
    if app.list_all_books.empty? || app.list_all_persons.empty?
      puts 'Cannot create a rental until there are books and people available.'
      puts
    else
      puts 'Choose a book from the list below by entering the corresponding number:'
      list_books(with_id: true)
      book = gets.chomp.to_i

      puts 'Choose a person from the following list by number (not id)'
      list_people(with_id: true)
      person = gets.chomp.to_i

      print 'Date: '
      date = gets.chomp

      puts 'Rental created successfully'
      puts
      app.create_a_rental(date, book, person)
    end
  end

  def list_books(with_id: false)
    if with_id
      app.list_all_books.each.with_index(0) do |book, index|
        puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
      end
    elsif app.list_all_books.empty?
      puts 'No books found.'
    else
      app.list_all_books.each do |book|
        puts "Title: \"#{book.title}\", Author: #{book.author}"
      end
    end
    puts
  end

  def list_people(with_id: false)
    if with_id
      app.list_all_persons.each.with_index(0) do |person, index|
        puts "#{index}) [#{person.class}] Name: \"#{person.name}\", ID: #{person.id}, Age: #{person.age}"
      end
    elsif app.list_all_persons.empty?
      puts 'No people found.'
    else
      app.list_all_persons.each do |person|
        puts "[#{person.class}] Name: \"#{person.name}\", ID: #{person.id}, Age: #{person.age}"
      end
    end
    puts
  end

  def list_rental_person
    puts 'List of Person IDs:'
    @app.list_all_persons.each { |person| puts "ID: #{person.id}, Name: #{person.name}" }

    print 'Enter the ID of the person to view rentals: '
    id = gets.chomp.to_i
    person = @app.list_all_persons.find { |p| p.id == id }

    if person.nil?
      puts 'Person not found.'
    else
      puts "Rentals for #{person.name}:"
      rentals = @app.list_rental_person(id)

      if rentals.empty?
        puts 'No rentals found for this person.'
      else
        rentals.each do |rental|
          puts "Date: \"#{rental.date}\", Book: #{rental.book.title} by #{rental.book.author}"
        end
      end
    end

    puts
  end

  def save_people_to_json
    people_data = @app.list_all_persons.map do |person|
      data = {
        'type' => person.class.to_s,
        'id' => person.id,
        'name' => person.name,
        'age' => person.age
      }

      if person.is_a?(Student) && person.respond_to?(:parent_permission)
        data['parent_permission'] = person.parent_permission
      end

      data
    end

    File.write('./data/people.json', JSON.generate(people_data))
  end

  private

  def create_student
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp.strip # Quita espacios en blanco alrededor del nombre

    print 'Has parent permission? [Y/N]: '
    parent_permission_input = gets.chomp.downcase
    parent_permission = parent_permission_input == 'y'

    if age <= 0 || name.empty? || (parent_permission_input != 'y' && parent_permission_input != 'n')
      puts 'Invalid input. Please provide valid values.'
      return
    end

    puts 'Student created successfully.'
    puts

    app.create_a_student(name, age, parent_permission)
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    puts 'Teacher created successfully.'
    puts

    app.create_a_teacher(name, age, specialization)
  end
end
