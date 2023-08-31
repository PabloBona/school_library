require_relative 'person'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'classroom'
require_relative 'student'
require_relative 'book'
require_relative 'rental'

person = Person.new(22, 'maximilianus')
puts person.correct_name

capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name

capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name

classroom = Classroom.new('Math')
student1 = Student.new(16, classroom, 'Alice')
student2 = Student.new(17, classroom, 'Bob')

puts "Classroom label: #{classroom.label}"
puts "Student 1: #{student1.name} (#{student1.age} years old)"
puts "Student 2: #{student2.name} (#{student2.age} years old)"

book = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')
person = Person.new(25, 'John')

rental = Rental.new('2023-08-30', person, book)
puts "Rental date: #{rental.date}"
puts "Rental person: #{rental.person.name}"
puts "Rental book: #{rental.book.title}"

person_rental_titles = person.rentals.map { |person_rental| person_rental.book.title }
book_rental_person_names = book.rentals.map { |book_rental| book_rental.person.name }

puts "Person's rentals: #{person_rental_titles}"
puts "Book's rentals: #{book_rental_person_names}"
