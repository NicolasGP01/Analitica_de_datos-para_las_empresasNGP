##############################################################################
#######                                                                #######
#                            Análisis de Datos                               #
#                              Administración                                #
#                 (Introducción con el lenguaje de programación Python)      #
#######                                                                 ######
##############################################################################

# By: Nicolás García Peñaloza
# nicolasgp0109@gmail.com

print("Introducción a Python")
#https://github.com/DiegoSReco/intro_python_para_economistas/tree/main

# ¿Qué versión tengo?
import sys
import platform

print("Versión de Python:", sys.version)
print("Detalles del sistema:")
print("Versión:", platform.python_version())
print("Implementación:", platform.python_implementation())
print("Sistema Operativo:", platform.system())
print("Arquitectura:", platform.machine())
print("Plataforma:", platform.platform())

print("Histórico de versiones de Python en:")
import webbrowser
webbrowser.open("https://www.python.org/downloads/")

print("Python dispone de una interfaz de línea de comandos que puede utilizarse de forma interactiva o por scripts.")
print("Puede escribirse código en la consola interactiva o ejecutarse desde un archivo .py")

# Recursos recomendados
webbrowser.open("https://docs.python.org/3/")
webbrowser.open("https://jupyter.org/")
webbrowser.open("https://realpython.com/")

'''
Python es un lenguaje de programación de propósito general.
Es un lenguaje orientado a objetos, versátil y muy usado en ciencia de datos,
automatización, desarrollo web, inteligencia artificial, entre otros.
'''

print("Entendamos cómo funciona Python en su entorno interactivo como Jupyter Notebooks o directamente con archivos .py")

# Más recursos:
webbrowser.open("https://colab.research.google.com/")
webbrowser.open("https://www.learnpython.org/")
webbrowser.open("https://www.youtube.com/watch?v=_uQrJ0TkZlc")  # Curso introductorio en video


# Formas de ejecutar Python
# I-1. Trabajando en la consola interactiva, cada comando se ejecuta con 'Enter'.
#      Se puede utilizar IDLE o entornos como Anaconda.
# I-2. Archivo .py: es más práctico para ejecutar varios comandos.
#      Se puede correr el archivo completo o por secciones en editores como VS Code, PyCharm o Jupyter. para ejecutar en Visual con 'Shift + Enter'
# II Para correr un comando en Jupyter se selecciona la celda y se presiona 'Shift + Enter'.
#    También se puede usar el botón "Run" o "Ejecutar".

# Tabla 1. Sintaxis de Python
import pandas as pd

##https://x.com/python_dv/status/1909345938499657927?s=48
print("Tabla de sintaxis, pruebas lógicas y operadores aritméticos en Python")


# Iniciemos ----

print("Operaciones elementales")
print(3 + 7)
print(10 - 1)
print(4.5 / 2.2)
print(4.8 * 5.5)
print(10**2)
print(10**0.69897)

print(((6+6) - (6-4)))
print(((2-2) - (4+4)))
print(((2*2) + (4*4)))
print(((2*2) / (4*4)))
print(((4**2) + (2/2)))
print(((4**2) * (3/2)))
print(((2/2) / (4+4)))
print(10/(2**6))
print((10 + 10 + 10 )/3)
print((10 + 10 + 10 )/(2**2))

import math
print(math.pi)
print(math.exp(1))
print(math.sqrt(5))
print(math.sqrt(8-4))

print((2**6)/abs(-2))
print(math.exp(1)**math.pi)

print(math.log(math.exp(1)))
print(math.exp(math.log(2.71828182846)))
print(math.log10(10))
print(math.log10(5))
print(math.sqrt(4)/2)
print(math.sqrt(8)/2.5)

# Pruebas lógicas
print(7 == 7)
print(19 <= 19)
print(10 != 10)
print(1 in [2,2,3,4,6,7,8,1,4])
print(22.2 in [10 , 22, 41.567 , 22.2 , 34 , 35435])

# Lenguaje orientado a objetos
print("Lenguaje orientado a objetos")
print("Los objetos pueden ser variables, listas, funciones, etc.")

# Visualizar variables en el espacio de trabajo
print("No hay un equivalente directo a ls() u objects() en Python, pero se puede usar globals() o locals()")
print(list(globals().keys()))

# Python trabaja naturalmente con operaciones vectorizadas usando librerías como numpy
import numpy as np

# Definir vectores
N = [2,1,3,20]
print(N)
print(N[3])  # Acceder a la 4ta posición

x = 3+7
a = 2
b = list(range(1,11))
c = list(range(1,11))
z = list(range(0,31,2))
y = [1,2,4,556,6]
v = np.random.normal(100, 1, 1000)  # distribución normal

OB = "Hola"
HOLA_1 = "Hola"
palabra = "19"
palabra_09 = "09"
UNIVERSIDAD = "UNIVERSIDAD DEL QUINDIO"
U_UNIVERSIDAD = "UNIVERSIDAD DEL QUINDIO "
nombres_1997 = ["Nicolas", "Garcia", "Peñaloza"]

print("¿Qué creamos?")
print(x)
print(a)
print(b)
print(c)
print(z)

print("¿a es igual a x?")
print(a == x)

print("¿b es igual a c?")
print(b == c)

print("¿z es igual a c?")
print(z == c)

print("¿OB es igual a HOLA_1?")
print(OB == HOLA_1)
print(OB == HOLA_1 == "Hola")

print("¿UNIVERSIDAD es igual a U_UNIVERSIDAD?")
print(UNIVERSIDAD == U_UNIVERSIDAD)

# Operaciones con listas y arrays
z_np = np.array(z)
b_np = np.array(b)
c_np = np.array(c)

print(z_np + 2)
print(b_np * 2)
print(c_np / 2)
print(np.log(v))
print(sum(y))
print(np.mean(v))
print(np.std(v))

# Trabajar con strings
print(OB + " Curso Cuentas Nacionales")
# print(OB + 14)  # Error, no se pueden concatenar strings y enteros directamente
print(OB + "14")

# Tipos de datos
x_num = 3.14
x_int = 5
x_char = "Hola mundo"
x_log = True
x_fac = pd.Categorical(["bajo", "medio", "alto", "medio"])

print(type(x_num))
print(type(x_int))
print(type(x_char))
print(type(x_log))
print(type(x_fac))

print(type(2))
print(type(x))
print(type(a))
print(type(y))
print(type("2"))
print(type(OB))
print(type(nombres_1997))

print("Usamos funciones como str(), type(), isinstance() para explorar datos en Python")
print(str("a"))
print(str(100))
print(str(0.001))
print(str(False))

print("Funciones isinstance() y conversión con int(), float(), str(), list(), etc.")

print(isinstance("1000", (int, float)))
print(isinstance(20, str))
print(isinstance(y, str))
print(isinstance(v, str))
print(isinstance(True, bool))

# Creamos un DataFrame (equivalente a data.frame en R)
import pandas as pd
import numpy as np

empresas = ["TechNova", "GreenWorld", "FinExpress"]
ventas = {
    "empresa": empresas,
    "ventas_2017": [2.5, 3.2, 1.8],
    "gastos_2017": [2.5, 3.2, 1.8],
    "ventas_2018": [3.1, 3.5, 2.0],
    "gastos_2018": [2.5, 3.2, 1.8],
    "ventas_2019": [3.8, 3.7, 2.6],
    "gastos_2019": [2.5, 3.2, 1.8],
    "ventas_2020": [4.5, 4.0, 3.1],
    "gastos_2020": [2.5, 3.2, 1.8],
    "ventas_2021": [5.0, 4.3, 3.5],
    "gastos_2021": [2.5, 3.2, 1.8],
    "ventas_2022": [5.7, 4.9, 4.0],
    "gastos_2022": [2.5, 3.2, 1.8],
    "ventas_2023": [6.2, 5.1, 4.4],
    "gastos_2023": [2.5, 3.2, 1.8]
}

ventas_df = pd.DataFrame(ventas)
print(ventas_df)

# También podemos usar matrices (arrays bidimensionales)
ventas_matrix = np.array([
    [2.5, 3.1, 3.8, 4.5, 5.0, 5.7, 6.2],      # TechNova
    [3.2, 3.5, 3.7, 4.0, 4.3, 4.9, 5.1],      # GreenWorld
    [1.8, 2.0, 2.6, 3.1, 3.5, 4.0, 4.4]       # FinExpress
])
print(ventas_matrix)

# Repetición de tareas con bucles
print("Usamos bucles for, while y estructuras de control como break")

# FOR loop
for i in range(1, 6):
    print(f"Iteración número: {i}")

# WHILE loop
contador = 1
while contador <= 3:
    print(f"Contador: {contador}")
    contador += 1

# Ciclo REPEAT (no existe como tal en Python, se simula con while True)
n = 1
while True:
    print(f"Número: {n}")
    n += 1
    if n > 3:
        break
