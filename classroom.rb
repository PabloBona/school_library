class Classroom
  attr_accessor :label, :students

  # combinación de attr_reader y attr_writer.
  # Genera automáticamente tanto los métodos getter como los métodos setter para los atributos especificados
  def initialize(label)
    @label = label
    # es una forma de almacenar información dentro de un objet, visibles en todos los métodos de un objeto
    # La variable @students es un arreglo que almacenará los estudiantes que pertenecen a la clase.
    @students = []
  end

  def add_student(student)
    student.classroom = self
    @students << student
  end
end
