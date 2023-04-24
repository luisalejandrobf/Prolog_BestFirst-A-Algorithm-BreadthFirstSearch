Luis Bravo, Camilo Garcia, Fabio Buitrago

##ENG...
Sample queries for the project...

To run the program... resolver(h1,h1,h1,h2,h2,h2,h1,h1).

ProyectoIA.pl -> Base project, with the rooms and boxes from the statement.
EjemploVariasHabitaciones.pl -> Base project, modified to include more rooms.
Variación-generalizacionRutas.pl -> Project modified to generalize the routes.

To execute the project, run swipl ProyectoIA.pl (or change depending on the project) in the project directory. Install swipl beforehand.

To query the location of an object: ubicacion(object, L). (Object should be changed to the name of the object to query)
For example, to perform the necessary movements to move the boxes and leave them in the desired order...
-> mover(caja(azul), h1, h2).
-> mover(robot, h1, h2).

To pick up a box using the robot (can only have one at a time): recoger(robot, caja(azul)).
To drop the box, use the soltar command: soltar(robot, caja(azul)).
Regardless of the movements performed by the robot, the location of the box will match after dropping it.

To test the resolution method -> resolver. (Except for generalization and justification)
To check the location of the robot and boxes after resolving...
-> ubicacion(robot, L).
-> ubicacion(caja(azul), L).
-> ubicacion(caja(roja), L).

To run the program that uses heuristics and moves from room to room in a generalized way, use -> resolver.

For the variation and generalization of routes program, an example of use is: resolver(h1,h1,azul,h5,h5).

If you want to perform more queries, type . after true (or press enter), and then write them.

##ESP...
Consultas de ejemplo para el proyecto...

Para correr la el programa... resolver(h1,h1,h1,h2,h2,h2,h1,h1).

ProyectoIA.pl -> Proyecto base, con las habitaciones y cajas del enunciado.
EjemploVariasHabitaciones.pl -> Proyecto base, modificado para incluir mas habitaciones.
Variación-generalizacionRutas.pl -> Proyecto modificado para generalizar las rutas.

Para ejecutar el proyecto, swipl ProyectoIA.pl (O dependiendo del proyecto cambia) en el directorio del mismo. Instalar previamente swipl

Para consultar la ubicacion de un objeto: ubicacion(objeto, L). (Objeto debe ser cambiado al nombre del objeto a consultar)
Por ejemplo, para realizar los movimientos necesarios para mover las cajas y que queden en el orden deseado...
-> mover(caja(azul), h1, h2).
-> mover(robot, h1, h2).

Para recoger una caja utilizando el robot (Solo puede tener una a la vez): recoger(robot, caja(azul)).
Para soltar la caja, se usa el comando soltar: soltar(robot, caja(azul)).
Sin importar los movimientos realizados por el robot, la ubicacion de la caja coincidira despues de soltarla.

Para probar el metodo de resolucion -> resolver. (Excepto para la generalizacion y la sustentacion)
Para revisar la ubicacion del robot y las cajas despues de resolver...
-> ubicacion(robot, L).
-> ubicacion(caja(azul), L).
-> ubicacion(caja(roja), L).

Para correr el programa que hace uso de la heuristica, y se mueve de habitacion en habitacion de forma generalizada,
utilizar -> resolver.

Con el programa de la variación y generalización de rutas, un ejemplo de uso es: resolver(h1,h1,azul,h5,h5).

En caso de querer realizar mas consultas, escribir . despues de true (o seleccionar enter), y posteriormente escribirlas.
