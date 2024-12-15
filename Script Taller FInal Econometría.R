# Cargar librerías necesarias
install.packages("ggplot2")
install.packages("reshape2")
install.packages("readxl")
install.packages("reshape2")
install.packages("tidyr")
library(tidyr)
library(reshape2)
library(ggplot2)
library(reshape2)
library(readxl)

# Cambia 'ruta_del_archivo.csv' por la ubicación de tu archivo CSV
setwd("C:/Users/juand/Desktop/Trabajo Final Econometría")
# Cambia la ruta del archivo a la correcta en tu sistema
data <- read_excel("C:/Users/juand/Desktop/Trabajo Final Econometría/Base de Datos Trabajo Final.xlsx")
head(data)
str(data)


# Convertir la columna de fechas en formato Date
data$Tiempo <- as.Date(data$Tiempo, format = "%Y/%m/%d")

# Verificar la estructura de los datos
str(data)

# Crear un gráfico de todas las series juntas
data_melted <- melt(data, id.vars = "Tiempo", variable.name = "Variable", value.name = "Valor")

ggplot(data_melted, aes(x = Tiempo, y = Valor, color = Variable)) +
  geom_line() +
  labs(title = "Evolución de las Variables en el Tiempo", x = "Tiempo", y = "Valor") +
  theme_minimal()

# Graficar cada variable por separado
ggplot(data, aes(x = Tiempo)) +
  geom_line(aes(y = TIB), color = "blue") +
  labs(title = "Tasa de Interés Básica (TIB)", x = "Tiempo", y = "TIB") +
  theme_minimal()

ggplot(data, aes(x = Tiempo)) +
  geom_line(aes(y = Inflacion), color = "red") +
  labs(title = "Inflación", x = "Tiempo", y = "Inflacion") +
  theme_minimal()

ggplot(data, aes(x = Tiempo)) +
  geom_line(aes(y = Desempleo), color = "green") +
  labs(title = "Desempleo", x = "Tiempo", y = "Desempleo") +
  theme_minimal()

