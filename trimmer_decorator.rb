require_relative 'decorator'

class TrimmerDecorator < Decorator
  def correct_name
    original_name = @nameable.correct_name
    original_name.length > 10 ? original_name[0..9] : original_name
  end
end
