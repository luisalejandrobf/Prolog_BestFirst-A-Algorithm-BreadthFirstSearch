Luis Bravo, Camilo Garcia, Fabio Buitrago
Consultas de ejemplo para el proyecto...

Para correr la sustentacion... resolver(h1,h1,h1,h2,h2,h2,h1,h1).



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

En caso de querer hacer mas consultas, poner . despues de true, y posteriormente escribirlas.