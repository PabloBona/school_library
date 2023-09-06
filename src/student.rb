require_relative 'person'
class Student < Person
  def initialize(age, _classroom = nil, name = 'Unknown', parent_permission: true, id: nil)
    super(age, name, parent_permission: parent_permission, id: id)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
