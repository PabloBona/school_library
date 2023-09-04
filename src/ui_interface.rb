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
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    print 'Specialisation: '
    specialisation = gets.chomp

    puts 'Teacher created successfully '
    puts

    app.create_a_teacher(name, age, specialisation)
  end
end
