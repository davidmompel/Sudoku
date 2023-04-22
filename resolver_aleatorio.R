resolver_aleatorio<-function(sudoku,len,numerospuestos,nivel)
{
  # Esta función resuelve el sudoku de manera aleatoria
  # Se hace de manera recursiva
  # Se coloca un número en una posición aleatoria y se completa el sudoku
  # Si el sudoku no tiene errores, se vuelve a llamar a la función
  # Si el sudoku tiene errores, se arroja error para que elimine este número en el nivel anterior
  # Argumentos:
  ## sudoku: el sudoku en cuestión
  ## len: número de filas/columnas/bloques del sudoku
  ## numerospuestos: listado de los números colocados aleatoriamente
  ## nivel: nivel de la recursividad
  
  # Se cargan las funciones necesarias
  source("resuelto.R")
  source("matriz_ocupados.R")
  
  # Si el sudoku está resuelto se devuelven los argumentos de entrada
  if(resuelto(sudoku,len))
  {
    return(list(sudoku=sudoku,len=len,numerospuestos=numerospuestos,nivel=nivel))
  }
  
  # Se busca una posición aleatoria vacía donde colocar un número aleatorio
  ocupado<-1
  while(ocupado)
  {
    irandom<-sample(c(1:9),1)
    jrandom<-sample(c(1:9),1)
    if(sudoku[irandom,jrandom]==0){ocupado<-0}
  }
  
  # Se miran qué números pueden ponerse en esa posición
  # Se utiliza la matriz ocupados de cada número
  numerosposibles<-c()
  for(i in 1:len)
  {
    matriz<-matriz_ocupados(sudoku,len,i)
    if(matriz[irandom,jrandom]!=1)
    {
      numerosposibles<-c(numerosposibles,i)
    }
  }
  
  # Se reordenan aleatoriamente para rellenar la posición elegida
  # Si solo hay un número el sample no funciona correctamente, por eso se pone la condición de longitud 
  if(length(numerosposibles)>1)
  {
    numerosposibles<-sample(numerosposibles)
  }
  
  # Se hace un bucle while infinito para ir rellenando la posición elegida
  # O devuelve error porque el número no era el correcto
  # O devuelve el sudoku ya resuelto
  while(1)
  {
    # Se crea un sudoku auxiliar para ir poniendole los números
    sudokuaux<-sudoku
    
    # Se selecciona el número a poner en la posición
    numerorandom<-numerosposibles[1]

    # Si la lista de números está vacía, se devuelve error al nivel anterior
    # La lista puede quedarse vacía si todos los posibles números han arrojado error
    # Lo que indica que el número del nivel anterior era erróneo
    if(length(numerosposibles)==0)
    {
      # Se devuelve error para que en la llamada anterior a la función no se tenga en cuenta este número
      return("Sudoku con errores, no hay más números, eliminar el nivel anterior")
    }
    # Si la lista no está vacía se intenta rellenar la posición con el número seleccionado de la lista
    else
    {
      # Se rellena un sudoku auxiliar con el número y se completa
      sudokuaux[irandom,jrandom]<-numerorandom
      sudokuaux<-completar(sudokuaux,len)

      # Si el sudoku auxiliar ha dado error en la función completar se pasa al siguiente número
      if(class(sudokuaux)=="character")
      {
        numerosposibles<-numerosposibles[-1]
      }
      # Si el sudoku auxiliar no ha dado error, se añade a la lista de números puestos
      else
      {
        numerospuestos[length(numerospuestos[,1])+1,]<-c(irandom,jrandom,numerorandom,nivel)
        
        # Si el sudoku está resuelto, se devuelve como resultado de la función
        if(resuelto(sudokuaux,len))
        {
          return(list(sudoku=sudokuaux,len=len,numerospuestos=numerospuestos,nivel=nivel))
        }
        # Si el sudoku no está resuelto, se vuelve a llamar a la función
        else
        {
          # Se guarda la llamada en result
          result<-resolver_aleatorio(sudokuaux,len,numerospuestos,nivel+1)
          
          #Si el resultado de la función ha sido un error, se pasa al siguiente número posible
          if(class(result)=="character")
          {
            # Se elimina el número puesto de la lista
            numerospuestos<-numerospuestos[-length(numerospuestos[,1]),]
            
            # Se pasa al siguiente elemento de la lista
            numerosposibles<-numerosposibles[-1]
          }
          # Si no ha habido error, se devuelve el resultado obtenido
          else
          {
            return(result)
          }
        }
      }
    }
  }
}

