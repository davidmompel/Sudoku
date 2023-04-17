
# Se asigna el directorio de trabajo
setwd("C:/Carpeta1/Carpeta2/etc")

# Se cargan los códigos necesarios para resolver el sudoku
## Este código carga el sudoku desde excel: no necesita argumentos
source("cargar_matriz.R")

## Este código completa los números que sean posibles del sudoku
### Argumentos: el sudoku y el número de filas/columnas de este
source("completar.R")

## Este código resuelve recursivamente el sudoku colocando números en posiciones aleatorias
### Argumentos: el sudoku, el número de filas/columnas de este, el listado de números puestos y el nivel de la iteración
source("resolver_aleatorio.R")

# Se carga el sudoku y se asigna a len el número de filas/columnas del sudoku
sudoku<-cargar_matriz()
len<-length(sudoku[1,])

# Se completa el sudoku
sudoku<-completar(sudoku,len)

# Se crea la lista vacía de números puestos para llamar a la función
numerospuestos<-data.frame(matrix(c(0,0,0,0),1,4))
names(numerospuestos)<-c("i","j","numero","nivel")
numerospuestos<-numerospuestos[-1,]

# Se resuelve el sudoku
resolver_aleatorio(sudoku,len,numerospuestos,1)
