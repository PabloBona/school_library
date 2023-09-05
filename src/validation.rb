module Validation
  def check_number(prompt)
    number = 0
    loop do
      print prompt
      input = gets.chomp.to_i
      if input.is_a?(Integer) && input.positive?
        number = input
        break
      else
        puts 'Please, enter a valid input!'
      end
    end
    number
  end

  def take_input(prompt)
    print prompt
    gets.chomp
  end

  def check_options(prompt, options)
    option = 0
    loop do
      print prompt
      input = gets.chomp.downcase
      if options.include?(input)
        option = input
        break
      else
        puts 'Please, enter a valid input!'
      end
    end
    option
  end
end
