habitacion(h1).
habitacion(h2).

caja(azul).
caja(roja).

ubicacion_inicial(robot, h1).
ubicacion_inicial(caja(azul), h1).
ubicacion_inicial(caja(roja), h1).

conexion(h1, h2).
conexion(h2, h1).

objetivo(caja(azul), h2).

mover_robot(A, B) :-
    ubicacion_inicial(robot, A),
    conexion(A, B),
    retract(ubicacion_inicial(robot, A)),
    assertz(ubicacion_inicial(robot, B)).

mover_caja(Caja, A, B) :-
    ubicacion_inicial(Caja, A),
    ubicacion_inicial(robot, A),
    conexion(A, B),
    retract(ubicacion_inicial(Caja, A)),
    assertz(ubicacion_inicial(Caja, B)).

heuristica :-
    ubicacion_inicial(robot, H),
    ubicacion_inicial(caja(azul), H),
    not(ubicacion_inicial(caja(roja), H)).
