require_relative 'app'

class Interface
  attr_accessor :app

  def initialize
    @app = App.new
  end

  def create_person
    loop do
      print 'Would you like to create a student (1) or a teacher (2)? [Please enter a number]:'
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
    puts 'Choose a book from the list below by entering the corresponding number:'
    list_books(with_id: true)
    book = gets.chomp

    puts 'Choose a person from the following list by number (not id)'
    list_people(with_id: true)
    person = gets.chomp

    print 'Date: '
    date = gets.chomp

    puts 'Rental created successfully'
    puts
    app.create_a_rental(date, book.to_i, person.to_i)
  end

  def list_books(with_id: false)
    if with_id
      app.list_all_books.each.with_index(0) do |book, index|
        puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
      end
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
    else
      app.list_all_persons.each do |person|
        puts "[#{person.class}] Name: \"#{person.name}\", ID: #{person.id}, Age: #{person.age}"
      end
    end
    puts
  end

  def list_rental_person
    print 'ID of person: '
    id = gets.chomp
    puts 'Rentals: '
    rentals = @app.list_rental_person(id.to_i)
    rentals&.each do |rental|
      puts "Date: \"#{rental.date}\", Book: #{rental.person.title} by #{rental.person.author}"
    end
    puts
  end

  private

  def create_student
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    print 'Has parents permission ? [Y/N]: '
    permission = gets.chomp

    puts 'Student created successfully.'
    puts

    app.create_a_student(name, age, permission)
  end
  
  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    print 'Specialisation: '
    specialisation = gets.chomp

    puts 'Teacher created successfully '
    puts

    app.create_a_teacher(name, age, specialisation)
  end

end
