rango_excel<-function(maxlen)
{
  # Esta función devuelve el rango de celdas a leer de un Excel
  # Argumentos:
  ## maxlen: el número de filas y columnas a leer
  
  # Se cargan las letras de las columnas del Excel
  letras<-c("A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z")
  
  # Se cuenta el número de letras que hay
  numletras<-length(letras)
  
  # Si maxlen es es menor que el número de letras, se devuelve la letra directamente
  if(maxlen<=numletras){return(paste("A1:",letras[maxlen],maxlen,sep=""))}
  
  # Se pasa el número a base numletras
  # iter indica el número de cifras que tienen maxlen como número en base numletras
  iter<-0
  
  while(maxlen>(numletras^iter))
  {
    iter<-iter+1
  }
  iter<-iter-1
  
  # Se modifica maxlen para poder pasarlo a base numletras
  numiter<-maxlen
  for(i in 0:iter)
  {
    numiter<-numiter-(numletras^i)
  }
  
  
  # Se calcula las letras de las columnas del Excel como un número de base numletras 
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
    charmaxlen<-paste(charmaxlen,letras[base[i]+1],sep="")
  }
  
  # Se guarda como rango de un Excel empezando desde la celda A1
  rango<-paste("A1:",charmaxlen,maxlen,sep="")
  
  # Se devuelve el rango a mirar del Excel
  return(rango)
}
