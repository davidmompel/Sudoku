completar<-function(sudoku,len)
{
  # Esta función completa el sudoku con las operaciones básicas, pero puede que NO lo resuelva completamente
  # En primer lugar se completan las filas, columnas y bloques que falten un número por poner
  # En segundo lugar se completan los números que solo pueden ir en una posición
  # Argumentos:
  ## sudoku: el sudoku en cuestión
  ## len: número de filas/columnas/bloques del sudoku

  # Se cargan las funciones necesarias
  source("rellenar_fila.R")
  source("rellenar_columna.R")
  source("rellenar_bloque.R")
  source("rellenar_matriz_ocupados.R")
  source("errores.R")
  
  # Se itera con un bucle while
  # El sudoku se va completando y si en alguna iteración se rellena con un número, se volverá a iterar
  
  # Se inicia la condición del bucle
  fincompletar<-FALSE
  
  # Comienza el bucle
  while(!fincompletar)
  {
    # Se cambia la condición del bucle para cancelarlo
    # Si se rellena con algún número se cambia para que se repita de nuevo
    fincompletar<-TRUE
  
    # Se completan las filas, columnas y bloques que solo queden un número por poner
    ## Se completan las filas
    for(i in 1:len)
    {
      if(sum(sudoku[i,]==0)==1)
      {
        sudoku<-rellenar_fila(sudoku,len,i)
        fincompletar<-FALSE
      }
    }
  
    ## Se completan las columnas
    for(j in 1:len)
    {
      if(sum(sudoku[,j]==0)==1)
      {
        sudoku<-rellenar_columna(sudoku,len,j)
        fincompletar<-FALSE
      }
    }
  
    ## Se completan los bloques
    for(ibloque in 1:sqrt(len))
    {
      for(jbloque in 1:sqrt(len))
      {
        count<-0
        for(i in (sqrt(len)*(ibloque-1)+1):(sqrt(len)*ibloque))
        {
          for(j in (sqrt(len)*(jbloque-1)+1):(sqrt(len)*jbloque))
          {
            count<-count+sum(sudoku[i,j]==0)
          }
        }
        if(count==1)
        {
          sudoku<-rellenar_bloque(sudoku,len,ibloque,jbloque)
          fincompletar<-FALSE
        }
      }
    }
    
    # Se completan los números que solo pueden ir en una casilla
    for(i in 1:len)
    {
      auxsudoku<-rellenar_matriz_ocupados(sudoku,len,i)
      if(max(!(sudoku==auxsudoku)))
      {
        sudoku<-auxsudoku
        fincompletar<-FALSE
      }
    }
    
    # Si ha habido errores en el sudoku, se devuelve un mensaje de error
    if(errores(sudoku,len))
    {
      return("Sudoku con errores")
    }
  }

  # Se devuelve el sudoku completado
  return(sudoku)
}