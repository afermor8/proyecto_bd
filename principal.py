#Programa principal

from funciones import *
import sys
import MySQLdb

try:
    bbdd= MySQLdb.connect("localhost","arantxa","1234","proyecto_bd")
except MySQLdb.Error as e:
    print("No puedo conectar a la base de datos:",e)
    sys.exit(1)
print ("Conexión correcta.\n --------------")

#Hacer menú
menu='''
Menú:
1. Mostrar número de películas y títulos
2. Buscar películas posteriores a un año dado
3. Mostrar datos de los actores que aparecen en una película de la base de datos
4. Insertar un nuevo actor
5. Borrar actores secundarios de una película
6. Actualizar puntuación de una película
7. Salir
8. (Para comprobación) Mostrar todos los actores de la base de datos
9. (Para comprobación) Mostrar actores secundarios y la película en que aparece
10. (Para comprobación) Mostrar puntuaciones de las películas
'''

print (menu)
opcion=int(input("Opción: "))

while opcion!=7:
#Mostrar número películas y títulos
    if opcion==1:
        print (mostrar_peliculas(bbdd),"\n --------------")

#Buscar películas posteriores a un año dado
    elif opcion==2:
        año=int(input("Dime un año: "))
        print (mostrar_titulos_post_a(bbdd,año),"\n ---------------")

#Pedir película y mostrar los actores que aparecen
    elif opcion==3:
        pelicula=input("Dime una película:")
        print (mostrar_actor(bbdd,pelicula),"\n --------------")

#Insertar datos de un actor
    elif opcion==4:
        datosactor=[]
        codigo=input("Dime el código del actor (máx 5 carácteres): ")
        nombre=input("Dime el nombre: ")
        apellido=input("Dime el apellido: ")
        fechanac=input("Dime su fecha de nacimiento (con el formato YYYY-MM-DD): ")
        datosactor.extend([codigo,nombre,apellido,fechanac])
        print (insertar_actor(bbdd,datosactor),"\n --------------")

#Borrar actores secundarios
    elif opcion==5:
        pelicula=input("Dime la película de la que quieres borrar sus actores secundarios: ")
        print (borrar_actor_secundario(bbdd,pelicula),"\n --------------")

#Actualizar puntuación de una película
    elif opcion==6:
        pelicula=input("Dime una película: ")
        puntuacion=float(input("Dime la puntuación: "))
        print (actualizar_puntuacion_pelicula(bbdd,pelicula,puntuacion),"\n --------------")

#Las opciones 8, 9 y 10 del menú son para comprobar que se han insertado, borrado y actualizado los datos correctamente
    elif opcion==8:
        print(mostrar_todos_los_actores(bbdd))

    elif opcion==9:
        print(mostrar_peliculas_secundarios(bbdd))

    elif opcion==10:
        print (mostrar_puntuaciones(bbdd))

    else:
        print ("No es una opción válida.")

    print (menu)
    opcion=int(input("Opción: "))

print ("Fin del programa.")

bbdd.close()

