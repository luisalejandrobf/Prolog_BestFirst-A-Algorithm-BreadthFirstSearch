% Luis Bravo, Camilo Garcia, Fabio Buitrago

% BASE DE HECHOS...

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


% Se definen HECHOS DINAMICOS que pueden modificarse en la ejecucion mediante assert y retract.
% Se utiliza el 2, para indicar que hay 2 argumentos. Ademas, assertz, asserta y retract solo pueden usarse dentro de reglas.
% Sin embargo, se pueden inicializar datos.
:- dynamic ubicacion/2.
ubicacion(robot, h1).
ubicacion(caja(azul), h1).
ubicacion(caja(roja), h1).



% DEFINICION DE REGLAS

% Se definen los objetivos finales del programa -> La caja azul debe terminar en h2, junto con el robot. La caja roja debe mantenerse en h1.
% Verificar que el objetivo se alcanzo (El programa cumple la solucion para el problema)
objetivo_cumplido :-
ubicacion(caja(azul), h2),
ubicacion(robot, h2),
ubicacion(caja(roja), h1).


% Mover objeto de una habitacion a otra (Puede ser el robot, o las cajas).
% Se debe verificar que la conexion de una habitacion a otra existe, para posteriormente retirar de la base de hechos dinamica el objeto de la primera habitacion y agregarla a la segunda.
mover(ObjetoAMover, HabitacionActual, HabitacionFinal) :-
conexion(HabitacionActual, HabitacionFinal),
retract(ubicacion(ObjetoAMover, HabitacionActual)),
assertz(ubicacion(ObjetoAMover, HabitacionFinal)).

% Recoger una caja (Solo el robot puede recoger una caja).
% Se extrae la ubicacion de la caja y se guarda en la variable UbicacionCaja, para verificar que el robot esta en la misma habitacion.
% Posteriormente, se elimina el hecho de la ubicacion previa de la caja y pasa a asociarse con el robot.
% Se podria utilizar directamente la habitacion h1, se utiliza la variable para generalizar la solucion.
% Se utiliza \+ (NEGACION) para verificar que no hay otra caja en el robot (Solo puede haber una). Si hay una preexistente, recoger falla.
recoger(Robot, Caja) :-
    ubicacion(Caja, UbicacionCaja),
    ubicacion(Robot, UbicacionCaja),
    forall((ubicacion(OtraCaja, Robot), OtraCaja \= Caja), fail),
	retract(ubicacion(Caja, UbicacionCaja)),
    assertz(ubicacion(Caja, Robot)).

% Soltar una caja (Solo el robot puede recoger una caja).
% Se extrae la caja del robot, y se guarda la posicion del robot, para posteriormente soltar la caja en la habitacion en la cual el mismo se encuentra.
% Se podria utilizar directamente la habitacion h2, se utiliza la variable UbicacionRobot para generalizar la solucion.
% De esta manera, el robot puede moverse y a la vez trasladar la caja.
soltar(Robot, Caja) :-
retract(ubicacion(Caja, Robot)),
ubicacion(Robot, UbicacionRobot),
assertz(ubicacion(Caja, UbicacionRobot)).



% Resolver el problema. Se recoge La caja azul en h1, y se lleva a h2.
% Al final, la caja azul y el robot quedan en H2, mientras la caja roja se mantiene en H1.
resolver :-
recoger(robot, caja(azul)),
mover(robot, h1, h2),
soltar(robot, caja(azul)).



% Heuristica tiene que ser la cantidad de habitaciones a recorrer antes de llegar al destino.
