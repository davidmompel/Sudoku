rellenar_columna<-function(sudoku,len,columna)
{
  # Esta función completa la columna de un sudoku en la que falta solo un número por completar
  # Argumentos:
  ## sudoku: el sudoku en cuestión
  ## len: número de filas/columnas/bloques del sudoku
  ## columna: columna que hay que completar
  
  # Se busca qué número es el que no se encuentra en la columna
  # Se rellena la posición vacía con ese número
  for(j in 1:len)
  {
    if(sum(sudoku[,columna]==j)==0){sudoku[which(sudoku[,columna]==0),columna]<-j}
  }
  
  # Se devuelve el sudoku con la fila completada
  return(sudoku)
}


