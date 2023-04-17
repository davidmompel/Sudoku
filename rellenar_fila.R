rellenar_fila<-function(sudoku,len,fila)
{
  # Esta función completa la fila de un sudoku en la que falta solo un número por completar
  # Argumentos:
  ## sudoku: el sudoku en cuestión
  ## len: número de filas/columnas/bloques del sudoku
  ## fila: fila que hay que completar
  
  # Se busca qué número es el que no se encuentra en la fila
  # Se rellena la posición vacía con ese número
  for(i in 1:len)
  {
    if(sum(sudoku[fila,]==i)==0){sudoku[fila,which(sudoku[fila,]==0)]<-i}
  }
  
  # Se devuelve el sudoku con la fila completada
  return(sudoku)
}


