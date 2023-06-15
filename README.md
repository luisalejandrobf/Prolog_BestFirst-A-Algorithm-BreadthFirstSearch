# Best First/A* Algorithm, Breadth-first Search

[English](#best-firsta-algorithm-breadth-first-search) | [Español](#algoritmo-best-firsta-búsqueda-en-anchura)

## About the Repository

This repository contains the implementation of the Best First/A* algorithm and Breadth-first search algorithm. It was developed as part of a project by Luis Bravo, Camilo Garcia, and Fabio Buitrago.

## Contents

The repository includes the following files:

- `ProyectoIA.pl`: Base project, containing the rooms and boxes specified in the project statement.
- `EjemploVariasHabitaciones.pl`: Base project modified to include additional rooms.
- `Variación-generalizacionRutas.pl`: Project modified to generalize the routes.

Feel free to explore the code in these files to understand the implementation of the algorithms.

## Usage

To execute the project, follow these steps:

1. Install SWI-Prolog on your system.
2. Navigate to the project directory.
3. Run `swipl ProyectoIA.pl` (or the corresponding file for the desired project) in the terminal or command prompt.

Once in the SWI-Prolog environment, you can perform the following queries:

- To query the location of an object: `ubicacion(object, L)`. Replace `object` with the name of the object you want to query.
- To perform the necessary movements to move the boxes and leave them in the desired order:
  - `mover(caja(azul), h1, h2)`.
  - `mover(robot, h1, h2)`.
- To pick up a box using the robot (can only have one at a time): `recoger(robot, caja(azul))`.
- To drop a box, use the `soltar` command: `soltar(robot, caja(azul))`.
- To check the location of the robot and boxes after resolving:
  - `ubicacion(robot, L)`.
  - `ubicacion(caja(azul), L)`.
  - `ubicacion(caja(roja), L)`.

To run the program that uses heuristics and moves from room to room in a generalized way, use the `resolver` query.

For the variation and generalization of routes program, an example of usage is: `resolver(h1,h1,azul,h5,h5)`.

If you want to perform additional queries, type `.` after `true` (or press Enter), and then write them.

⭐️ **Found it useful? Please consider giving it a star and help spread the word!** ⭐️

---

# Algoritmo Best First/A*, Búsqueda en Anchura

[English](#best-firsta-algorithm-breadth-first-search) | [Español](#algoritmo-best-firsta-búsqueda-en-anchura)

## Acerca del Repositorio

Este repositorio contiene la implementación del algoritmo Best First/A* y el algoritmo de búsqueda en anchura. Fue desarrollado como parte de un proyecto realizado por Luis Bravo, Camilo Garcia y Fabio Buitrago.

## Contenido

El repositorio incluye los siguientes archivos:

- `ProyectoIA.pl`: Proyecto base que contiene las habitaciones y cajas especificadas en el enunciado del proyecto.
- `EjemploVariasHabitaciones.pl`: Proyecto base modificado para incluir habitaciones adicionales.
- `Variación-generalizacionRutas.pl`: Proyecto modificado para generalizar las rutas.

Siéntete libre de explorar el código de estos archivos para comprender la implementación de los algoritmos.

## Uso

Para ejecutar el proyecto, sigue estos pasos:

1. Instala SWI-Prolog en tu sistema.
2. Navega hasta el directorio del proyecto.
3. Ejecuta `swipl ProyectoIA.pl` (o el archivo correspondiente al proyecto deseado) en la terminal o símbolo del sistema.

Una vez en el entorno de SWI-Prolog, puedes realizar las siguientes consultas:

- Para consultar la ubicación de un objeto: `ubicacion(objeto, L)`. Reemplaza `objeto` con el nombre del objeto que deseas consultar.
- Para realizar los movimientos necesarios para mover las cajas y que queden en el orden deseado:
  - `mover(caja(azul), h1, h2)`.
  - `mover(robot, h1, h2)`.
- Para recoger una caja utilizando el robot (solo puede tener una a la vez): `recoger(robot, caja(azul))`.
- Para soltar una caja, utiliza el comando `soltar`: `soltar(robot, caja(azul))`.
- Para revisar la ubicación del robot y las cajas después de resolver:
  - `ubicacion(robot, L)`.
  - `ubicacion(caja(azul), L)`.
  - `ubicacion(caja(roja), L)`.

Para ejecutar el programa que utiliza heurísticas y se mueve de habitación en habitación de forma generalizada, utiliza la consulta `resolver`.

Para el programa de variación y generalización de rutas, un ejemplo de uso es: `resolver(h1,h1,azul,h5,h5)`.

Si deseas realizar consultas adicionales, escribe `.` después de `true` (o presiona Enter) y luego escríbelas.

⭐️ **¿Te resultó útil? ¡Considera darle una estrella y ayuda a difundirlo!** ⭐️
