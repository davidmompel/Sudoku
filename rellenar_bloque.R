rellenar_bloque<-function(sudoku,len,filabloque,columnabloque)
{
  # Esta función completa el bloque de coordenadas (f,c) de un sudoku en el que falta solo un número por completar
  # Argumentos:
  ## sudoku: el sudoku en cuestión
  ## len: número de filas/columnas/bloques del sudoku
  ## filabloque: posición f de las coordenadas del bloque que hay que completar. Toma valores 1...sqrt(len)
  ## columnabloque: posición c de las coordenadas del bloque que hay que completar. Toma valores 1...sqrt(len)
  
  # Se toma el bloque del sudoku que hay que completar
  parte<-sudoku[(sqrt(len)*(filabloque-1)+1):(sqrt(len)*filabloque),(sqrt(len)*(columnabloque-1)+1):(sqrt(len)*columnabloque)]
  
  # Se cuentan los números que aparecen en el bloque y se guardan en la variable valori
  # El número i a completar será el que tenga valori igual a 0
  for(i in 1:len)
  {
    assign(paste("valor",i,sep=""),sum(parte[,]==i))
  }
  
  # Se inicializan las coordenadas del bloque a 1
  irellenar<-1
  jrellenar<-1

  # Se busca en el bloque qué posición es la que está sin completar
  for(i in 1:sqrt(len))
  {
    for(j in 1:sqrt(len))
    {
      if(parte[i,j]==0)
      {
      irellenar<-i
      jrellenar<-j
      }
    }
  }

  # Se busca cuál es el valori que sea 0 y se rellena la posición del bloque con esa i
  for(i in 1:len)
  {
    if(get(paste("valor",i,sep=""))==0){parte[irellenar,jrellenar]<-i}
  }

  # Se actualiza el bloque del sudoku
  sudoku[(sqrt(len)*(filabloque-1)+1):(sqrt(len)*filabloque),(sqrt(len)*(columnabloque-1)+1):(sqrt(len)*columnabloque)]<-parte
  
  # Se devuelve el sudoku con el bloque completado
  return(sudoku)
}

