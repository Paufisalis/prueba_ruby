def read_alum(file_name)
  file = File.open(file_name, 'r')
  alum = file.readlines.map(&:chomp).map { |lines| lines.split(', ') }
  file.close
  alum
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
    puts 'saliste del menu'
  else
    puts 'opcion no valida'
  end
end
