import pandas as pd

# Leer datos
df = pd.read_csv("notas.csv")

# Generar tabla de frecuencias
tab = pd.crosstab(index=df["nota"],columns="frecuencia")
print(tab)

# Buscar el elemento 5 (el elemento que cumple la condición de que su índice es igual a 5)
fila = tab.loc[tab.index == 5]
# Obtenemos el valor "frecuencia" de la fila
x = fila["frecuencia"]
x = int(x)
print("%d alumnos han sacado un 5" % x)