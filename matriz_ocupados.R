matriz_ocupados<-function(sudoku,len,numero)
{
  # Esta función devuelve una matriz de 0s y 1s que indica si el número puede ir en esa posición
  # Argumentos:
  ## sudoku: el sudoku en cuestión
  ## len: número de filas/columnas/bloques del sudoku
  ## numero: el número a comprobar
  
  # Se genera una matriz vacía de ceros
  matriznumero<-matrix(0,len,len)

  # Se revisa el sudoku por primera vez: números
  # Se pone 1 en la matriz si ya hay un número
  for(i in 1:len)
  {
    for(j in 1:len)
    {
      if(sudoku[i,j]!=0)
      {
        matriznumero[i,j]<-1
      }
    }
  }  
  
  # Se revisa el sudoku por segunda vez: filas y columnas
  # Si en la posición está el número, se pone 1 en toda la fila y toda la columna
  for(i in 1:len)
  {
    for(j in 1:len)
    {
      if(sudoku[i,j]==numero)
      {
        # Rellenamos la fila
        matriznumero[i,]<-1
        
        # Rellenamos la columna
        matriznumero[,j]<-1
      }
    }
  }

  # Se revisa el sudoku por tercera vez: bloques
  # Si en algún lugar de bloque está el número, se pone 1 en todo el bloque 
  for(ibloque in 1:sqrt(len))
  {
    for(jbloque in 1:sqrt(len))
    {
      for(i in (sqrt(len)*(ibloque-1)+1):(sqrt(len)*ibloque))
      {
        for(j in (sqrt(len)*(jbloque-1)+1):(sqrt(len)*jbloque))
        {
          if(sudoku[i,j]==numero)
          {
            matriznumero[(sqrt(len)*(ibloque-1)+1):(sqrt(len)*ibloque),(sqrt(len)*(jbloque-1)+1):(sqrt(len)*jbloque)]<-1
          }
        }
      }
    }
  }
  
  # Se devuelve la matriz de 0s y 1s
  return(matriznumero)
}



