require_relative 'app'

class Main
  def initialize
    @app = App.new
  end

  def create_a_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialisation: '
    specialisation = gets.chomp
    puts 'Person created successfully '
    puts
    @app.create_a_teacher(age, specialisation, name)
  end

  def create_a_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parents permission ? [y/n]: '
    permission = gets.chomp
    puts 'Person created successfully '
    puts
    @app.create_a_student(name, age, permission)
  end

  def create_a_person
    loop do
      print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
      option = gets.chomp

      case option
      when '1'
        create_a_student
        break
      when '2'
        create_a_teacher
        break
      else
        puts 'Option unknown'
      end
    end
  end

  def create_a_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @app.create_a_book(title, author)
    puts 'Book created successfully'
    puts
  end

  def create_a_rental
    puts 'Select a book from the following list by number'
    list_all_books(with_id: true)
    book = gets.chomp
    puts 'Select a person from the following list by number(not id)'
    list_all_persons(with_id: true)
    person = gets.chomp
    print 'Date: '
    date = gets.chomp
    puts 'Rental created successfully'
    puts
    @app.create_a_rental(date, book.to_i, person.to_i)
  end

  def list_rental_person
    print 'ID of person: '
    id = gets.chomp
    puts 'Rentals: '
    rentals = @app.list_rental_person(id.to_i)
    rentals&.each do |rental|
      puts "Date: \"#{rental.date}\", Book: #{rental.book.title} by #{rental.book.author}"
    end
    puts
  end

  def menu
    puts 'Please choose an option by entering a number: '
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def list_all_books(with_id: false)
    if with_id
      @app.list_all_books.each.with_index(0) do |book, idx|
        puts "#{idx}) Title: \"#{book.title}\", Author: #{book.author}"
      end
    else
      @app.list_all_books.each do |book|
        puts "Title: \"#{book.title}\", Author: #{book.author}"
      end
    end
    puts
  end

  def list_all_persons(with_id: false)
    if with_id
      @app.list_all_persons.each.with_index(0) do |person, idx|
        puts "#{idx}) [#{person.class}] Name: \"#{person.name}\", ID: #{person.id}, Age: #{person.age}"
      end
    else
      @app.list_all_persons.each do |person|
        puts "[#{person.class}] Name: \"#{person.name}\", ID: #{person.id}, Age: #{person.age}"
      end
    end
    puts
  end

  def main
    puts 'Welcome to school library App!'
    puts

    options = %i[list_all_books list_all_persons create_a_person create_a_book create_a_rental list_rental_person]

    loop do
      menu
      option = gets.chomp
      break if option == '7'

      if option.to_i.positive? && option.to_i < 7
        send(options[option.to_i - 1])
      else
        puts 'Option unknown'
      end
    end
    puts 'Thank you for using this app!'
  end
end

Main.new.main
