require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(age, specialization, name = 'Unknown', parent_permission: true, id: nil)
    super(age, name, parent_permission: parent_permission, id: id)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
