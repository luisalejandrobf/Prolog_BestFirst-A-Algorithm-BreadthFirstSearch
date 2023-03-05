% Luis Bravo, Camilo Garcia, Fabio Buitrago

% Bases de Hechos

% Se definen las conexiones entre las habitaciones h1 y h2.
habitacion(h1).
habitacion(h2).
conexion(h1, h2).
conexion(h2, h1).

% Se definen las cajas de colores.
caja(azul).
caja(roja).

% Se define la ubicacion inicial del robot y las cajas.
ubicacion_inicial(robot, h1).
ubicacion_inicial(caja(azul), h1).
ubicacion_inicial(caja(roja), h1).

% Se definen los objetivos finales del programa.
objetivo(caja(azul), h2).
objetivo(robot, h2).
objetivo(caja(roja), h1).

% Definicion de reglas