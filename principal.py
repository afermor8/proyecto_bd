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


#Mostrar número películas y títulos
print (mostrar_peliculas(bbdd),"\n --------------")


#Buscar películas posteriores a un año dado
año=int(input("Dime un año: "))
print (mostrar_titulos_post_a(bbdd,año),"\n ---------------")


#Pedir película y mostrar los actores que aparecen
pelicula=input("Dime una película:")
print (mostrar_actor(bbdd,pelicula),"\n --------------")

bbdd.close()

