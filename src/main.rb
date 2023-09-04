require_relative 'ui_interface'

class Main
  attr_accessor :interface

  def initialize
    @interface = Interface.new
  end

  def menu
    puts 'Please choose an option by entering a number: '
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person(student or teacher)'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def main
    puts 'Welcome to OOP School Library Application!'
    puts

    options = %i[list_books list_people create_person create_book create_a_rental list_rental_person]

    loop do
      menu
      option = gets.chomp
      break if option == '7'

      if option.to_i.positive? && option.to_i < 7
        interface.send(options[option.to_i - 1])
      else
        puts 'Option unknown'
      end
    end
    puts 'Appreciate your usage of this application!'
  end
end

Main.new.main
