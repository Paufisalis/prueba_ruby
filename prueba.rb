def read_alum(file_name)
  file = File.open(file_name, 'r')
  alum = file.readlines.map(&:chomp).map { |lines| lines.split(', ') }
  file.close
  alum
end
def end_line
  puts "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
end

#Opción 1: visualiza en pantalla el nombre de cada alumno y el promedio de sus notas (30puntos)
def name_average
  student_list = read_alum('alumnos.csv')#recorre el array de student_list o lista estudiante
  student_list.each do |average_list| #variable average_list o lista promedio
    sum = 0
    average_list.each_with_index do |student, index|
      sum += student.to_f unless index == 0 #aqui para sacar el promedio paso el valor de student a float
    end
    puts "Nombre alumno: #{average_list[0]} \nSu promedio es: #{sum/5}" # el total de la suma lo div por el total de notas, A se toma como 0
  end
  end_line
end

#opcion 2:  Imprime en pantalla el nombre de cada alumno y la cantidad de inasistencias
def absent_student
  student_list = read_alum('alumnos.csv')
  student_list.each do |absent_student| #itera en el array, student_list tiene una variable absent_student que seria cada array que esta adentro
    sum = 0 #se le agrega un contador en este caso sum en cero
    absent_student.each_with_index do |absent, index| #aqui recorro dentro de los array mas pequeños con sus dos variables absent e index
      sum += 1 if absent == "A" #agrego la operacion suma, en cada vuelta suma 1,  si encuentra un elemento que sea "A" sume 1
    end
    puts "Nombre alumno: #{absent_student[0]}, Número de inasistencias: #{sum}" #aqui se muestra el Estudiante con el índice 0 que es donde están los nombres tiene "la suma" que es donde contó cada "A" o sea, cada inasistencia
  end
  end_line
end


#opcion 3:  Imprimir en pantalla los nombres de los alumnos aprobados / Crear un método que reciba -como argumento- la nota necesaria para aprobar. Por defecto esa nota debe ser 5.0
def name_approved
  puts "Ingresa nota de aprobacion:"
  nota=gets.chomp.to_i

  student_list = read_alum('alumnos.csv')  #recorre el array de student_list
  student_list.each do |average_list| #variable average_list
    sum = 0
    average_list.each_with_index do |student, index| #{} es una interpolacion
      sum += student.to_f unless index == 0
    end
    if sum/5>=nota
      puts "Alumno aprobado: #{average_list[0]}  \nNota aprobación: #{sum/5}"
    end
  end
  end_line
end

#Crea un menu de 4 opciones
option = 0 #declaro una variable
while option !=4 #cuando es distinto de 4 entrega esto
  puts "Elige una opcion entre 1 y 4 :"
  puts "opcion 1: visualiza en pantalla el nombre de cada alumno y el promedio de sus notas (30puntos)"
  puts "opcion 2: visualiza en pantalla el nombre de cada alumno y la cantidad de inasistencias(30 puntos)"
  puts "opcion 3: Imprime en pantalla los nombres de los alumnos aprobados (30 puntos)"
  puts "opcion 4: Salir"
  option = gets.chomp.to_i
  case option
  when 1 #aqui se llaman los metodos
    name_average
  when 2
    absent_student
  when 3
    name_approved
  when 4
    puts 'Saliste del programa'
  else
    puts 'opcion no valida'
  end
end
