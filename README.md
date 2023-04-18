# Solucionador de Sudokus - David Mompel Lancina
## Un algoritmo para resolver cualquier sudoku
### Última actualización: 17/04/2023

El objetivo de este proyecto es resolver un sudoku. 
Se carga en la memoria a través de un Excel el sudoku y se completan las filas, columnas y bloques que se pueda.
Una vez completado el sudoku, se resuelve el sudoku de manera recursiva con una función que sigue los siguientes pasos:

<ol>
  <li> Se elige una posición aleatoria.
  <li> Se obtienen los números posibles y se rellena la posición con uno de ellos.
  <li> Con el número puesto, se completan las filas, columnas y bloques del sudoku que se pueda.
    <ul>
      <li> Si hay error en el sudoku, se elimina el número de la lista y se vuelve al paso 2.
      <li> Si no hay error.
        <ul>
          <li> Si el sudoku está resuelto, se devuelve el resultado.
          <li> Si el sudoku no está resuelto, se llama a la función recursivamente.
        </ul>
    </ul>
</ol>

De aquí en adelante intentaré mejorar el algoritmo para que sea más eficiente y actualizaré los archivos. Si has detectado algún error, házmelo saber y lo corregiré en alguna futura versión.

El algoritmo ha sido comprobado resolviendo los sudokus más difíciles del libro "Sudoku para expertos (Vol. 3)" de Alastair Chisholm con ISBN 978-84-414-2483-8, resolviendo todos de manera satisfactoria.

### Notas
<ul>
  <li> Se requiere tener instalado la librería "readxl".
  <li> En el Excel que se usa para cargar el sudoku, es necesario que todas las filas y todas las columnas tengan al menos un número. 
  <li> Obviamente el sudoku que se carga en el Excel tiene que ser cuadrado, con un número de filas y columnas que sea cuadrado perfecto.
  <li> No hay que ponerle nombre a las filas y columnas del Excel, si no da error.
</ul>

#### Historial de cambios
17/04/2023: Primera versión.

18/04/2023: Se corrige la función "resolver_aleatorio". El "sample" del vector "numerosposibles" daba un resultado erróneo cuando tenía longitud 1. Con longitud 1 no se consideraba como vector, sino como un entero, y se generaba un número aleatorio entre 1 y este número, por lo que se colocaba en la posición un número erróneo que podía hacer fallar el algoritmo. 
