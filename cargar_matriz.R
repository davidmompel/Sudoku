cargar_matriz<-function()
{
  # Esta función carga el sudoku desde la hoja "Sudoku" del Excel "Sudoku.xlsx"
  # Es necesario que haya un número en cada fila y cada columna, si no da error
  # No hace falta poner nombre a las filas y columnas en el Excel, si no da error
  # El Excel tiene que tener el mismo número de filas y columnas, si no da error 
  # El Excel tiene que tener un número de filas y columnas que sea cuadrado perfecto, si no da error
  # Es necesario instalar la librería readxl
  # Argumentos: no tiene
  
  # Se carga la librería readxl para leer el Excel
  require(readxl)
  
  # Se carga el Excel de datos
  archivo<-data.frame(read_excel("Sudoku.xlsx",sheet="Sudoku",col_names=FALSE))
  
  # Se guarda el número de filas y columnas de los datos cargados
  rlen<-length(archivo[,1])
  clen<-length(archivo[1,])

  # Se comprueba que las dimensiones de filas y columnas son iguales
  if(rlen!=clen){stop("Las dimensiones de filas y columnas no coinciden")}
  # Se comprueba que las dimensiones son cuadrados perfectos
  if(sqrt(rlen)%%1 != 0){stop("Las dimensiones no son cuadrados perfectos")}

  # Se cambian los nombres a las filas y columnas
  ## Filas: Fi
  ## Columnas: Ci
  for(i in 1:length(archivo[1,]))
  {  
     row.names(archivo)[i]<-paste("F",i,sep="")
     names(archivo)[i]<-paste("C",i,sep="")
  }

  # Se cambian los valores cargados como NA de los números a completar por 0  
  for(i in 1:length(archivo[,1]))
  {  
    for(j in 1:length(archivo[1,]))
    {  
      if(is.na(archivo[i,j])){archivo[i,j]<-0}
    }  
  }  

  # Se devuelve el sudoku cargado
  return(archivo)
}


