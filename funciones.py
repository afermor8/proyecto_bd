#Funciones para el programa principal

def mostrar_peliculas(db):
    sql="select titulo from pelicula"
    cursor=db.cursor()
    try:
        cursor.execute(sql)
        if cursor.rowcount==0:
            print ("No hay películas en la base de datos")
        else:
            print ("Número de películas en la base de datos: ",cursor.rowcount,"\nTítulos:")
            registros=cursor.fetchall()
            for registro in registros:
                for title in registro:
                    print ("  -->",title)
    except:
        print ("Error en la conulta.")


def mostrar_titulos_post_a(db,año):
    sql= "select titulo from pelicula where extract(year from fecha_estreno) > %d" % año
    cursor=db.cursor()
    try:
        cursor.execute(sql)
        if cursor.rowcount==0:
            print ("No hay películas posteriores a ese año.")
        else:
            print ("Películas posteriores a esa fecha:")
            registros=cursor.fetchall()
            for registro in registros:
                for var in registro:
                    print ("  -->",var)
    except:
        print ("Error en la consulta.")


def mostrar_actor(db,title):
    sql= "select * from actor where codigo in (select codigo_actor from pelicula_actor where codigo_pelicula in (select codigo from pelicula where titulo='%s'))" % title
    cursor= db.cursor()
    try:
        cursor.execute(sql)
        if cursor.rowcount==0:
            print ("No hay actores relacionados con esa película.")
        else:
            print ("Actores de la película:")
            registros=cursor.fetchall()
            for registro in registros:
                print ("  -->",registro[1],registro[2],"-- Fecha nac:",registro[3],"-- Código:",registro[0])
    except:
        print ("Error en la consulta.")


def insertar_actor(db,actor):
    cursor= db.cursor()
    sql= "insert into actor values ('%s','%s','%s','%s')" % (actor[0],actor[1],actor[2],actor[3])
    try:
        cursor.execute(sql)
        db.commit()
        print ("\nDatos insertados correctamente.")
    except:
        print ("\nERROR. Comprueba que has insertado los datos correctamente.")
        db.rollback()


def mostrar_todos_los_actores(db):
    sql= "select * from actor"
    cursor=db.cursor()
    try:
        cursor.execute(sql)
        if cursor.rowcount==0:
            print ("No hay actores en la base de datos.")
        else:
            registros=cursor.fetchall()
            print ("\nActores en la base de datos: ")
            for registro in registros:
                print ("  -->",registro[1],registro[2],"-- Fecha nac:",registro[3],"-- Código:",registro[0])
    except:
        print ("Error en la consulta.")
