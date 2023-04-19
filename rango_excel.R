rango_excel<-function(maxlen)
{
  # Esta función devuelve el rango de celdas a leer de un Excel
  # Argumentos:
  ## maxlen: el número de filas y columnas a leer
  
  # Se cargan las letras de las columnas del Excel
  letras<-c("A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z")
  
  # Se cuenta el número de letras que hay
  numletras<-length(letras)
  
  # En un Excel hay columnas con como máximo 3 letras
  iter<-2
  
  # Se calcula las letras de las columnas del Excel como un número de base numletras 
  numiter<-maxlen
  base<-c()
  for(i in iter:0)
  {
    num<-floor(numiter/(numletras^i))
    base<-c(base,num)
    numiter<-numiter-num*(numletras^i)
  }
  
  # Una vez obtenido el número como base numletras, se traducen por las letras correspondientes
  charmaxlen<-""
  for(i in 1:length(base))
  {
    charmaxlen<-paste(charmaxlen,letras[base[i]],sep="")
  }
  
  # Se guarda como rango de un Excel empezando desde la celda A1
  rango<-paste("A1:",charmaxlen,maxlen,sep="")
  
  # Se devuelve el rango a mirar del Excel
  return(rango)
}