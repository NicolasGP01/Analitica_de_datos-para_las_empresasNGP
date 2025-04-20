##############################################################################
#######                                                                #######
#                            Análisis de Datos                               #
#                              Administración                                #
#                 (Indroducción con el lenguaje de programación R)           #
#######                                                                 ######
##############################################################################

#By: Nicolás García Peñaloza
#nicolasgp0109@gmail.com

print("Introducción a R. (Rstudio)")
browseURL(url = "https://r-coder.com/r-introduction/", browser = getOption("browser"))

print("¿Qué version tengo?")
version
sessionInfo()

print("Historico de versiones")
browseURL(url = "https://cran.r-project.org/bin/windows/base/old/", browser = getOption("browser"))

  
print("R dispone de una interfaz de línea de comandos que puede utilizarse de forma interactiva o por lotes. Los comandos pueden teclearse en el prompt de la ventana de la consola de R, o enviarse mediante el comando fuente")

browseURL(url = "https://bookdown.org/jboscomendoza/r-principiantes4/", browser = getOption("browser"))
browseURL(url = "https://rsanchezs.gitbooks.io/rprogramming/content/index.html", browser = getOption("browser"))

"R es un lenguaje de programación y entorno computacional dedicado a la estadística, 
un lenguaje orientado a objetos, un sistema de cálculo estadístico y gráficos. Se compone
de un lenguaje más un entorno de ejecución con gráficos, generalmente" 


print("Entendamos cómo funciona R en su IDE Rstudio")
browseURL(url = "https://bookdown.org/manishpatwal/bookdown-demo/", browser = getOption("browser"))
browseURL(url = "https://msperlin.com/afedr/introduction", browser = getOption("browser"))
browseURL(url = "https://www.youtube.com/watch?v=pvJ5FaT9Kj4", browser = getOption("browser"))


# Formas de ejecutar R
# I-1. Trabajando en la consola de R, y después de cada comado se da 'Enter' 
#    la consola de R es la ventana que generalmente se ubica en la parte inferior izquierda (al frente de usted),
#    sin embargo se puede abrir solo la consola de R sin utilizar la IDE: Rstudio.
# I-2. Archivo-Nuevo script: es más práctico para ejecutar varios comandos. 
#   Se le denomina "Scrit" al presente archivo donde esta leyendo toda la información de -Introducción a R.-
# II Para correr un comando se ubica el cursor en la línea de comando (adelante o atras)
#   y se presiona 'ctrl + enter'. También se puede seleccionar todas las líneas del comado y presionar
#   'ctrl + enter' o dar click en "Run" -arriba-.

' Tabla 1. Sintaxis de R

| Simbolo       | Descripción                    |   Ejemplo              |
| ------------- | ------------------------------ | ---------------------- |
|      #        | Comentario                     | # Hola R               |
|   <- o =      | Asignar                        | A <- 2 o B = "hola"    |
|      c        | Contiene                       | c(1,2,3) o c("H" ,"L") |
|    seq()      | Secuencia de 1 hasta 10 en 1   | seq(1,10,1)            |
|      :        | Operador de secuencia          | 10:100                 |
| ------------- | ------------------------------ | ---------------------- |

-Pruebas lógicas
| Simbolo       | Descripción                    |   Ejemplo              |
| ------------- | ------------------------------ | ---------------------- |
|      >        | Mayor que                      |  10 > 5 o 2 > 10       |
|      <        | Menor que                      |  20 < 10 o 4 < 20      |
|      <=       | Menor o igual a                |  1997 <= 1997 o 2 <= 1 |
|      >=       | Mayor o igual a                |  19 <= 19 o 4 >= 2     |
|      ==       | igual a                        |  7 == 7 o 4 == 2       |
|      !=       | Diferente a                    |  10 != 10 o 7 != 6     |
|      &        | Intersección                   |        S & X           |
|      |        |  o                             |        A | B           |
|     %in%      |  En                            |  1 %in%  c(2,1,9,4)    |
| ------------- | ------------------------------ | ---------------------- |

-Operadores
| Simbolo       | Descripción                    |   Ejemplo              |
| ------------- | ------------------------------ | ---------------------- |
|      +        |  Más                           |         1+2            |
|      -        |  Menos                         |         4-2            |
|      *        |  Multiplicación                |         3*3            |
|      /        |  División                      |         10/5           |
|      ^        |  Exponenial                    |         2^6            |
|     sqrt()    |  Raíz cuadrada                 |        sqrt(4)         |
|     exp()     |  Exponenial e                  |        exp(1)          |
|      pi       |  Número Pi                     |          pi            |
|     log()     |  Logaritmo base e              |    log(2.71828182846)  |
|     abs()     |  Valor absoluto                |        abs(-2)         |
| ------------- | ------------------------------ | ---------------------- |
3 %*% 3
2 %/% 2
'


# Iniciemos -----

print("Operaciones elementales")
3+7
10-1
4.5/2.2
4.8*5.5
10^2
10^0.69897

((6+6) - (6-4))
((2-2) - (4+4))
((2*2) + (4*4))
((2*2) / (4*4))
((4^2) + (2/2))
((4^2) * (3/2))
((2/2) / (4+4))
(10/(2^6))
(10 + 10 + 10 )/3
(10 + 10 + 10 )/(2^2)

pi
exp(1)
sqrt(5)
sqrt(8-4)

(2^6)/abs(-2)
exp(1)^pi

log(exp(1))
exp(log(2.71828182846))
log10(10)
log10(5)
sqrt(4)/2
sqrt(8)/2.5

7 == 7
4 = 2
19 <= 19
10 != 10
1 %in%  c(2,2,3,4,6,7,8,1,4)
22.2 %in%  c(10 , 22, 41.567 , 22.2 , 34 , 35435)

#Subamos el nivel -------
print("Lenguaje orientado a objetos")

# Los comandos objects() y ls() visualizan el listado de objetos presentes en 
# el actual espacio o área de trabajo (workspace)

objects()
ls()

# Con rm() podemos eliminar objetos
rm()


# R está diseñado de forma que la mayoría de operaciones y de funciones 
# están definidas con carácter vectorial

# La función principal para definir un vector es a través de sus componentes, 
# con la función c()
# Para referirnos a la componente enésima del vector v escribiremos v[n]

N = c(2,1,3,20)
N
N[4]
rm(N)

x = 3+7
a <- 2
b = seq(1,10,1)
c = 1:10
z = seq(0,30,2)
y = c(1,2,4,556,6)
#set.seed(19970901)
v = rnorm(1000 , 100 , 1 )

OB = "Hola"
HOLA_1 = "Hola"
palabra = "19"
palabra_09 = "09"
UNIVERSIDAD = "UNIVERSIDAD DEL QUINDIO"
U_UNIVERSIDAD = "UNIVERSIDAD DEL QUINDIO "
nombres_1997 = c("Nicolas" , "Garcia" , "Peñaloza" )

print("¿Qué creamos?")
print(x)
a
print(b)
c
z

print("¿a es igual x?")
# a == x

print("¿b es igual c?")
#b == c

print("¿z es igual c?")
#Z==c

print("¿OB es igual HOLA_1?")
OB == HOLA_1
OB == HOLA_1 == "Hola" # Respetemos la estructura del lenguaje

print("¿UNIVERSIDAD es igual U_UNIVERSIDAD?")

UNIVERSIDAD == U_UNIVERSIDAD


print("Hagamos operaciones a nuestros vectores")
z+2

b*2

c/2

log(v)

sum(y)
mean(v)
sd(v)

print("Trabajemos con string")
paste0(OB, " Curso Cuentas Nacionales")

# Respetemos la estructura del lenguaje
OB + " Curso Cuentas Nacionales"
OB + "14" 


# Tipos de datos-------
' Tabla 2. Tipos de datos en R

| tipo          | Descripción                    |
| ------------- | ------------------------------ |
|  Numeric      | 1 , 100 , 1.2 , 00.5           |
|  Character    | "Hola Nicolás" ,"1997"         |
|  Factor       | Etiquetas                      |
|  Logical      | FALSE, TRUE, NA                |
| ------------- | ------------------------------ |
'

#Tipos de variables y su clase
x_num = 3.14             # numérico decimal
x_int = 5L               # entero (L lo indica)
x_char = "Hola mundo"    # texto
x_log = TRUE             # lógico: verdadero o falso
x_fac = factor(c("bajo", "medio", "alto", "medio"))  # categórico

class(x_num)   # numeric
class(x_int)   # integer
class(x_char)  # character
class(x_log)   # logical
class(x_fac)   # factor

typeof(2)
typeof(x)
typeof(a)
typeof(y)
typeof("2")
typeof(OB)
typeof(nombres_1997)

class(NA) ; class(1+100) ; class(0.5); class("Texto"); class("1") ; class(nombres_1997) ; class(x) ; class(a)

print("Generalmente cuando trabajamos con bases de datos utilizamos la función str()")
str("a") ; str(100) ; str(0.001) ; str(FALSE) 

print("Las funciones 'class' y 'typeof' son utiles para determinar el tipo de dato, mientras que  la función 'str' sera de mayor utilidad para otros objetos") 
print("Funciones is.() y as.()")

print("Las funciones is.() me devueleven un elemento logical como 'FALSE' o 'TRUE'")
is.numeric("1000") ; is.character(20) ; is.character(y) ; is.character(v) ; is.logical(TRUE) ; is.factor(9)

print("Las funciones as.() se usan para convertir un elemento de un formato a otro")
as.numeric("1000") ; as.numeric(palabra) ; as.numeric(palabra_09) ; as.character(20) ; as.character(y) ; as.character(v) ; as.factor(9)

print("Sin embargo, se debe tener cuidado con la funcion as.() porque al convertir datos de character a numeric puede perderse informacion")
as(c("1000 M","7","25","y7"),"numeric",TRUE)



dim(c)
length(c) # 1 dimensional array

a = matrix(0, nrow=2, ncol=2)
a

a = matrix(1:8, nrow=2, ncol=4)
a

a = matrix(1:4, nrow=2, ncol=4)
a
dim(a)

y_1 = array(c, dim=c(50, 3, 1))
y_1
y_4 = array(c, dim=c(50, 3, 4))
y_1 = as.data.frame(y_1)
y_1
y_4 = as.data.frame(y_4)

print("¿Qué hizo R al especificarle que es un marco de datos?")
y_4

## Paquetes --------------------
print("Como lo hemos escuchado en R se desarrollan diferentes librerias gracias a los aportes de su comunidad")

# ¿Cuántas librerias tengo descargadas?
library()

# ¿Cuantas librerias tenemos cargadas en la memoria?
search()

# Para descargar una libreria que nunca he descargado a mi programa utilizo esto.
#install.packages("tidyverse")

# luego llamo la libreria.
library(tidyverse)

# Revisar la información de la libreria
sessioninfo::session_info(c("tidyverse"))

# Versión del paquete
packageVersion("tidyverse")

# Librerias de las cuales hayan versiones nuevas.
old.packages()

# Actualizar las librerias.
update.packages()

# Encontrar una libreria que NO se tenga.
help.search("")

# ubicación de la librería en el local
.libPaths()

# Si quiero eliminar el paquete del disco duro.
remove.packages("NOMBRE DEL PAQUETE")
remove.packages("NOMBRE DEL PAQUETE", lib="~/R/win-library/4.0")


## ¿Cómo actualizar R?
#install.packages("installr")#, dependencies = TRUE)
library(installr)
#updateR() # Sí - Sí - No

# Cargar librerías necesarias
library(tibble)
library(data.table)

# Estructuras tabulares con datos reales
# Años de análisis
anios <- 2017:2023

# Empresas ficticias
empresas <- c("TechNova", "GreenWorld", "FinExpress")

# Ventas anuales por empresa
ventas_df <- data.frame(
  empresa = empresas,
  ventas_2017 = c(2.5, 3.2, 1.8),
  gastos_2027 = c(2.5, 3.2, 1.8),
  ventas_2018 = c(3.1, 3.5, 2.0),
  gastos_2019 = c(2.5, 3.2, 1.8),
  ventas_2019 = c(3.8, 3.7, 2.6),
  gastos_2020 = c(2.5, 3.2, 1.8),
  ventas_2020 = c(4.5, 4.0, 3.1),
  gastos_2021 = c(2.5, 3.2, 1.8),
  ventas_2021 = c(5.0, 4.3, 3.5),
  gastos_2022 = c(2.5, 3.2, 1.8),
  ventas_2022 = c(5.7, 4.9, 4.0),
  gastos_2023 = c(2.5, 3.2, 1.8),
  ventas_2023 = c(6.2, 5.1, 4.4)
)
print(ventas_df)

# tibble: misma información, formato más limpio
ventas_tibble <- tibble(
  empresa = empresas,
  ventas_2017 = c(2.5, 3.2, 1.8),
  gastos_2017 = c(2.5, 3.2, 1.8),
  ventas_2018 = c(3.1, 3.5, 2.0),
  gastos_2018 = c(2.5, 3.2, 1.8),
  ventas_2019 = c(3.8, 3.7, 2.6),
  gastos_2019 = c(2.5, 3.2, 1.8),
  ventas_2020 = c(4.5, 4.0, 3.1),
  gastos_2020 = c(2.5, 3.2, 1.8),
  ventas_2021 = c(5.0, 4.3, 3.5),
  gastos_2021 = c(2.5, 3.2, 1.8),
  ventas_2042 = c(5.7, 4.9, 4.0),
  gastos_2022 = c(2.5, 3.2, 1.8),
  ventas_2023 = c(6.2, 5.1, 4.4),
  gastos_2023 = c(2.5, 3.2, 1.8)
)
print(ventas_tibble)

# matrix: solo valores de ventas (sin nombres)
ventas_matrix <- matrix(
  data = c(
    2.5, 3.1, 3.8, 4.5, 5.0, 5.7, 6.2,      # TechNova
    3.2, 3.5, 3.7, 4.0, 4.3, 4.9, 5.1,      # GreenWorld
    1.8, 2.0, 2.6, 3.1, 3.5, 4.0, 4.4       # FinExpress
  ),
  nrow = 3,
  ncol = 7,
  byrow = TRUE,
  dimnames = list(empresas, paste0("Y", 2017:2023))
)
print(ventas_matrix)

# data.table
ventas_dt <- data.table(
  empresa = empresas,
  ventas_2017 = c(2.5, 3.2, 1.8),
  gastos_2017 = c(2.5, 3.2, 1.8),
  ventas_2018 = c(3.1, 3.5, 2.0),
  gastos_2018 = c(2.5, 3.2, 1.8),
  ventas_2019 = c(3.8, 3.7, 2.6),
  gastos_2019 = c(2.5, 3.2, 1.8),
  ventas_2020 = c(4.5, 4.0, 3.1),
  gastos_2020 = c(2.5, 3.2, 1.8),
  ventas_2021 = c(5.0, 4.3, 3.5),
  gastos_2021 = c(2.5, 3.2, 1.8),
  ventas_2022 = c(5.7, 4.9, 4.0),
  gastos_2022 = c(2.5, 3.2, 1.8),
  ventas_2023 = c(6.2, 5.1, 4.4),
  gastos_2023 = c(2.5, 3.2, 1.8)
)
print(ventas_dt)

# Bucles en R: repetir tareas
# FOR: útil cuando conocemos la cantidad de repeticiones
for (i in 1:5) {
  mensaje <- paste("Iteración número:", i)
  print(mensaje)
  # Cada ciclo toma un valor de la secuencia 1:5 y ejecuta el bloque
}

#  WHILE: ejecuta mientras se cumpla la condición
contador <- 1
while (contador <= 3) {
  print(paste("Contador:", contador))
  contador <- contador + 1  # importante actualizar para evitar bucle infinito
}

# REPEAT: ejecuta indefinidamente hasta encontrar un 'break'
n <- 1
repeat {
  print(paste("Número:", n))
  n <- n + 1
  if (n > 3) {
    break  # detenemos el ciclo manualmente
  }
}

print("Tengamos en cuenta dos principios a la hora de codificar: 1) nuesto código debe ser secuencial, debe tener un orden. 2) Optimo, nuestro código debe estar optimizado, lo cual representa hacer el trabajo con las menores lineas de código")
