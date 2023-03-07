% Luis Bravo, Camilo Garcia, Fabio Buitrago

% BASE DE HECHOS...

% Se definen las conexiones entre las habitaciones h1 y h2.
habitacion(h1).
habitacion(h2).
habitacion(h3).
habitacion(h4).
habitacion(h5).
habitacion(h6).
habitacion(h7).
conexion(h1, h2).
conexion(h2, h1).
conexion(h2, h3).
conexion(h3, h4).
conexion(h3, h5).
conexion(h5, h7).
conexion(h7, h6).

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

% Heuristica: Cantidad de habitaciones a recorrer antes de llegar al destino.
heuristica(HabitacionInicial, Solucion, Tam) :-
    busquedaEnAnchura([[HabitacionInicial]], Solucion1),
    reverse(Solucion1, Solucion),
	length(Solucion1, Tam).

% Se realiza la busqueda en anchura del grafo. Por llamada se toma el primer camino de la lista y se extiende para agregar a la lista de caminos sin visitar
% Recursivamente se llama la funcion con la nueva lista generada, hasta alcanzar el nodo meta.
busquedaEnAnchura( [ [Nodo | Camino] | _], [Nodo | Camino])  :-
  goal(Nodo).

busquedaEnAnchura( [Camino | Caminos], Solucion)  :-
  extend( Camino, NuevosCaminos),
  append( Caminos, NuevosCaminos, Caminos1),
  busquedaEnAnchura( Caminos1, Solucion).
  
% Se utiliza para extender el camino. Con ! Prolog intenta evitar que el backtracking continue para buscar otras soluciones para el predicado actual y busca una solución única (Evitar caminos repetidos)
% Bagof sirve para obtener todas las posibles soluciones que satisfacen
% Member se utiliza para verificar si un elemento está presente en una lista. Para evitar duplicados.
% El bagof se usa para meter los posibles caminos en NuevosCaminos. Cada camino dentro de la lista tiene una tupla (NuevoNodo, Nodo), y quedan el resto de elementos que conforman el camino.
extend( [Nodo | Camino], NuevosCaminos)  :-
  bagof( [NuevoNodo, Nodo | Camino],
         ( conexion( Nodo, NuevoNodo), \+ member( NuevoNodo, [Nodo | Camino] ) ),
         NuevosCaminos),
  !.

% Se Define la Meta a la cual se debe llegar (Nodo final)
extend( Camino, [] ).
goal(h7).

% Regla para encontrar la siguiente habitacion a proceder, segun la heuristica.
% findall se usa para encontrar todas las posibles soluciones a una consulta y almacenarlas en una lista
% keysort se utiliza para ordenar la lista por clave (El valor de la heuristica). Se selecciona la primera habitacion.
habitacionDeMinimaHeuristica(Habitaciones, HabitacionInicial, Solucion, HabMinima) :-
    findall(Tam-Habitacion, (
        member(Habitacion, Habitaciones),
        heuristica(HabitacionInicial, Solucion, Tam)
    ), ListaHab),
    keysort(ListaHab, [ValorMinimo-HabMinima | _]).

% Consigue la siguiente habitacion a la cual proceder, segun la heuristica.
% Se construye ListaHab para generar las soluciones (Tuplas: Habitacion, Heuristica), con findall, esto para las habitaciones siguientes con heuristica H.
% Se ordena la lista de habitaciones y se selecciona la de menor heuristica en orden ascendente (@=<). Se usa 2, porque la heuristica es el segundo elemento de la tupla.
% _ significa "cualquier cosa" en Prolog
conseguirSiguienteHabitacion(Habitacion, SiguienteHab) :-
    findall([Siguiente, H], (conexion(Habitacion, Siguiente), heuristica(Siguiente, _, H)), ListaHab),
    sort(2, @=<, ListaHab, [[SiguienteHab, _] | _]).

% Se encarga de buscar la habitacion de la minima heuristica, para posteriormente, de manera recursiva, mover el robot habitacion tras habitacion.
resolver_heuristica :-
    habitacionDeMinimaHeuristica([h1,h2,h3,h4,h5,h6,h7], h1, Solucion, HabMinima),
    resolver_heuristica_recursivo(HabMinima, Solucion).

resolver_heuristica_recursivo(Habitacion, Solucion) :-
    heuristica(Habitacion, Solucion, Heuristica),
    (Heuristica =:= 1 ->
        writeln("Llegamos al destino! " + Habitacion),
        true
    ;
		writeln("NO Hemos llegado al destino (Actualmente en " + Habitacion + ")..."),
        conseguirSiguienteHabitacion(Habitacion, SiguienteHab),
        ubicacion(robot, L),
        mover(robot, L, SiguienteHab),
        resolver_heuristica_recursivo(SiguienteHab, SolucionAux)
    ).

% Sin importar la funcion utilizada, la meta siempre se considera al estar atada a la heuristica.



% Se encarga de resolver el problema. Se recoge La caja azul en h1, y se lleva a h2.
% Al final, la caja azul y el robot quedan en H2, mientras la caja roja se mantiene en H1.
% Recoge la caja al inicio, y realiza el recorrido haciendo uso de resolver_heuristica, que mueve al robot haciendo uso de la ruta construida mediante la funcion heuristica.
resolver :-
writeln("Luis Bravo, Camilo Garcia, Fabio Buitrago. Proyecto 1 IIA. Prolog"),
writeln("La caja azul se encuentra incialmente en H1. El robot la recoge y se mueve a h2."),
recoger(robot, caja(azul)),
resolver_heuristica,
soltar(robot, caja(azul)),
ubicacion(caja(azul), L),
writeln("Tras soltar la caja, estando en h2, la ubicacion de la caja azul es " +L).