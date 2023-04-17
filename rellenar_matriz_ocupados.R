rellenar_matriz_ocupados<-function(sudoku,len,numero)
{
  # Esta función completa las posiciones en las que solo puede ir un número
  # Argumentos:
  ## sudoku: el sudoku en cuestión
  ## len: número de filas/columnas/bloques del sudoku
  ## numero: número para completar las posiciones
  
  # Se cargan las funciones necesarias
  source("matriz_ocupados.R")
  
  # Se guarda la matriz de ocupados del número
  matriznumero<-matriz_ocupados(sudoku,len,numero)

  # Se rellenan las filas
  # Si en las filas de la matriz de ocupados solo hay una posición con cero, se rellena con el número
  for(i in 1:len)
  {
    if(sum(matriznumero[i,]==0)==1)
    {
      sudoku[i,which(matriznumero[i,]==0)]<-numero
    }
  }

  # Se actualiza la matriz de ocupados del número
  matriznumero<-matriz_ocupados(sudoku,len,numero)
  
  # Se rellenan las columnas
  # Si en las columnas de la matriz de ocupados solo hay una posición con cero, se rellena con el número
  for(j in 1:len)
  {
    if(sum(matriznumero[,j]==0)==1)
    {
      sudoku[which(matriznumero[,j]==0),j]<-numero
    }
  }
  
  # Se actualiza la matriz de ocupados del número
  matriznumero<-matriz_ocupados(sudoku,len,numero)
  
  # Se rellenan los bloques
  # Si en los bloques de la matriz de ocupados solo hay una posición con cero, se rellena con el número
  for(ibloque in 1:sqrt(len))
  {
    for(jbloque in 1:sqrt(len))
    {
      count<-0
      for(i in (sqrt(len)*(ibloque-1)+1):(sqrt(len)*ibloque))
      {
        for(j in (sqrt(len)*(jbloque-1)+1):(sqrt(len)*jbloque))
        {
          count<-count+sum(matriznumero[i,j]==0)
        }
      }
      if(count==1)
      {
        for(i in (sqrt(len)*(ibloque-1)+1):(sqrt(len)*ibloque))
        {
          for(j in (sqrt(len)*(jbloque-1)+1):(sqrt(len)*jbloque))
          {
            if(matriznumero[i,j]==0)
            {
              sudoku[i,j]<-numero
            }
          }
        }      
      }
    }
  }
  
  #Se devuelve el sudoku completado
  return(sudoku)
}




