require_relative 'app'

class Interface
  attr_accessor :app

  def initialize
    @app = App.new
  end

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
end
