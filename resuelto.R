resuelto<-function(sudoku,len)
{
  # Esta función comprueba si el sudoku está resuelto o no
  # Argumentos:
  ## sudoku: el sudoku en cuestión
  ## len: número de filas/columnas/bloques del sudoku
  
  # Si no hay ningún cero en el sudoku se devuelve TRUE
  if(sum(sudoku==0)==0){return(TRUE)}
  else{return(FALSE)}
}