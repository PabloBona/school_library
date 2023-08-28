class Person
  def initialize(id, age, name = 'Unknown', parent_permission: true)
    @id = id
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  def getid
    @id
  end

  def getage
    @age
  end

  def getname
    @name
  end

  def setname=(name)
    @name = name
  end

  def setage=(age)
    @age = age
  end
end
