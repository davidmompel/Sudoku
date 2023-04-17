errores<-function(sudoku,len)
{
  # Esta función comprueba que no haya errores en el sudoku que se está resolviendo
  # El sudoku no hace falta que esté completo
  # La función devuelve TRUE si hay algún error y FALSE en caso contrario
  # Argumentos:
  ## sudoku: el sudoku en cuestión
  ## len: número de filas/columnas/bloques del sudoku
  
  # Se realizan dos comprobaciones´
  ## Primera comprobación: se revisa que no haya números repetidos en filas, columnas y bloques
  ## Segunda comprobación: se revisa que no haya espacios vacios que no puedan completarse con ningún número 
  
  # Se cargan las funciones necesarias
  source("matriz_ocupados.R")
  
  # Primera comporbación: números repetidos 
  ## Si en la fila/columna/bloque hay algún número repetido, se devuelve TRUE
  
  ## Se miran las filas
  for(num in 1:len)
  {
    for(i in 1:len)
    {
      if(sum(sudoku[i,]==num) > 1){return(TRUE)}
    }
  }
  
  ## Se miran las columnas
  for(num in 1:len)
  {
    for(j in 1:len)
    {
      if(sum(sudoku[,j]==num) > 1){return(TRUE)}
    }
  }
  
  ## Se miran los bloques
  for(num in 1:len)
  {
    for(ibloque in 1:sqrt(len))
    {
      for(jbloque in 1:sqrt(len))
      {
        if(sum(sudoku[(sqrt(len)*(ibloque-1)+1):(sqrt(len)*ibloque),(sqrt(len)*(jbloque-1)+1):(sqrt(len)*jbloque)]==num) > 1){return(TRUE)}
      }
    }
  }
  
  # Segunda comprobación: posiciones que no pueden completarse con ningún número
  ## Por separado se revisan filas, columnas y bloques
  ## Si alguno tiene una posición por rellenar, se analiza las matrices de números ocupados de cada número
  ## Se suman los ceros de las matrices de ocupados de los números en la fila/columna/bloque en cuestión
  ## Si no hay ningún cero en toda la fila/columna/bloque se devuelve TRUE
  
  ## Se guardan las matrices de posiciones ocupadas para cada número en las matrices ocuni
  for(i in 1:len)
  {
    assign(paste("ocun",i,sep=""),matriz_ocupados(sudoku,len,i))
  }
  
  ## Se miran las filas
  ## Si en la fila hay algún cero, se miran las matrices ocupados de los números
  ## Se cuentan los ceros en las filas de las matrices
  ## Si no hay ningún cero, se devuelve error
  ## Si hay menos ceros que posiciones vacías, se devuelve error
  for(i in 1:len)
  {
    if(sum(sudoku[i,]==0) > 0)
    {
      suma<-0
      for(num in 1:len)
      {
        suma<-suma+sum(get(paste("ocun",num,sep=""))[i,]==0)
      }
      if(suma==0 || suma < sum(sudoku[i,]==0)){return(TRUE)}
    }
  }
  
  ## Se miran las columnas
  ## Si en la columna hay algún cero, se miran las matrices ocupados de los números
  ## Se cuentan los ceros en las columnas de las matrices
  ## Si no hay ningún cero, se devuelve error
  ## Si hay menos ceros que posiciones vacías, se devuelve error
  for(j in 1:len)
  {
    if(sum(sudoku[,j]==0) > 0)
    {
      suma<-0
      for(num in 1:len)
      {
        suma<-suma+sum(get(paste("ocun",num,sep=""))[,j]==0)
      }
      if(suma==0 || suma < sum(sudoku[,j]==0)){return(TRUE)}
    }
  }
  
  ## Se miran los bloques
  ## Si en el bloque hay algún cero, se miran las matrices ocupados de los números
  ## Se cuentan los ceros en los bloques de las matrices
  ## Si no hay ningún cero, se devuelve error
  ## Si hay menos ceros que posiciones vacías, se devuelve error
  for(ibloque in 1:sqrt(len))
  {
    for(jbloque in 1:sqrt(len))
    {
      if(sum(sudoku[(sqrt(len)*(ibloque-1)+1):(sqrt(len)*ibloque),(sqrt(len)*(jbloque-1)+1):(sqrt(len)*jbloque)]==0) > 0)
      {
        suma<-0
        for(num in 1:len)
        {
          suma<-suma+sum(get(paste("ocun",num,sep=""))[(sqrt(len)*(ibloque-1)+1):(sqrt(len)*ibloque),(sqrt(len)*(jbloque-1)+1):(sqrt(len)*jbloque)]==0)
        }
        if(suma==0 || suma < sum(sudoku[(sqrt(len)*(ibloque-1)+1):(sqrt(len)*ibloque),(sqrt(len)*(jbloque-1)+1):(sqrt(len)*jbloque)]==0)){return(TRUE)}
      }
    }
  }

  # Se devuelve FALSE si no ha habido errores anteriores
  return(FALSE)
}