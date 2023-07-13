# Best First/A* Algorithm, Breadth-first Search

![Visitor Badge](https://visitor-badge.feriirawann.repl.co?username=luisalejandrobf&repo=Prolog_BestFirst-A-Algorithm-BreadthFirstSearch&label=Welcome%20to%20the%20repository!%20You're%20visitor%20number&style=flat-square&color=%233864CF&contentType=svg)

[English](#best-firsta-algorithm-breadth-first-search) | [Español](#algoritmo-best-firsta-búsqueda-en-anchura)

## About the Repository

This repository contains the implementation of the Best First/A* algorithm and Breadth-first search algorithm. It was developed as part of a project by Luis Bravo, Camilo Garcia, and Fabio Buitrago.

## Contents

The repository includes the following files:

In the `ProjectContents` folder, you will find:
- `Proyecto IIA.pdf`: Documentation explaining the functioning of the heuristic used, calculations, and the overall code implementation.
- `ProyectoIA.pl`: Base project containing the specified rooms and boxes as mentioned in the project statement.
- `EjemploVariasHabitaciones.pl`: Modified base project to include additional rooms.
- `Variación-generalizacionRutas.pl`: Project modified to generalize the routes.

In the `Sustentation` folder, you will find:
- Images of the algorithm execution and different tests.
- `Instructions_Presentation.txt`: Instructions for the specific execution of the code during the presentation.
- `SustentationProject.pl`: Project modified to include the A* algorithm in the base project and generalized.

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

En la carpeta `ProjectContents`, podrá encontrar:
- `Proyuecto IIA.pdf`: Funcionamiento de la heurística utilizada y cálculos, además del funcionamiento general del código.
- `ProyectoIA.pl`: Proyecto base que contiene las habitaciones y cajas especificadas en el enunciado del proyecto.
- `EjemploVariasHabitaciones.pl`: Proyecto base modificado para incluir habitaciones adicionales.
- `Variación-generalizacionRutas.pl`: Proyecto modificado para generalizar las rutas.

En la carpeta `Sustentation` podrá encontrar:
- Imágenes de la corrida del algoritmo y distintas pruebas.
- `Instrucciones_Sustentación.txt`: Instrucciones para la corrida específica de la sustentación realizada del código.
- `SustentacionProyecto.pl`: Proyecto Modificado para incluir el algoritmo A* en el proyecto base y generalizado.

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
