##############################################################################
#######                                                                #######
#                            Análisis de Datos                               #
#                                Economía                                    #
#                     (Técnicas de Medición Económica)                       #
#######                                                                 ######
##############################################################################

#By: Nicolás García Peñaloza
#nicolasgp0109@gmail.com

## Nociones iniciales.
getwd() # ¿Dónde está parado R?
options('scipen'=100, 'digits'=4) # Fuerzo a R de no usar notación cientifica.
rm(list=ls()) # Limpio la memoria interna de R.
setwd("C:/Users/ANA MARIA/Desktop/Nicolas") # Paremos a R en una carpeta especifica


## Paquetes requeridos.
print("IMPORTANTE!! Primero asegurarse que si estos paquetes estan instalados, si no lo estan los instalan con install.packages('NOMBRE DE PAQUETE')")
paquetes = c('devtools' , 
             'skimr' ,  'readxl' , 
             'stringr' , 'stringi' , 'reshape' ,
             'viridis' ,'tidyverse'
             )


print("IMPORTANTE!! Una vez se asegura que esten instalados llamar la libreria")

sapply(paquetes,require,character.only=T) ; rm(paquetes )



### SECCIÓN DE POBLACIÓN Y PROYECCIONES -----------------------
### Base de datos de 1985 - 1994
POBLA_1985 = read_excel("C:/Users/nicol.NICOLAS_GP/Dropbox/Data Bases/Población/Proyecciones/DCD-area-sexo-edad-proypoblacion-Mun-1985-1994.xlsx" , range = "A12:JG33672") |> 
  data.frame() |> dplyr::rename( "MPIO_CDPMP" = "DPMP" , "MUNICIPIO" = "MPIO")

#### Base de datos de 1995 - 2004
POBLA_1995 = read_excel("C:/Users/nicol.NICOLAS_GP/Dropbox/Data Bases/Población/Proyecciones/DCD-area-sexo-edad-proypoblacion-Mun-1995-2004.xlsx" , range = "A12:JG33672") |> 
  data.frame() |> dplyr::rename( "MPIO_CDPMP" = "DPMP" , "MUNICIPIO" = "MPIO")

#### Base de datos de 2005 - 2019
POBLA_2005 = read_excel( "C:/Users/nicol.NICOLAS_GP/Dropbox/Data Bases/Población/Proyecciones/DCD-area-sexo-edad-proypoblacion-Mun-2005-2019.xlsx" , range = "A12:JG50502") |> 
  data.frame() |> dplyr::rename( "MPIO_CDPMP" = "MPIO" , "MUNICIPIO" = "DPMP" )

#### Base de datos de 2020 - 2035
POBLA_2020 = read_excel( "C:/Users/nicol.NICOLAS_GP/Dropbox/Data Bases/Población/Proyecciones/DCD-area-sexo-edad-proypoblacion-Mun-2020-2035-ActPostCOVID-19.xlsx" , range = "A9:JG53865") |> 
  data.frame() |> dplyr::rename( "MPIO_CDPMP" = "MPIO" , "MUNICIPIO" = "DPMP" )

print("IMPORTANTE!! Tomar en cuenta que los nombres de los vectores esten homogenizados.")

### Ensamble -------
POBLA = plyr::rbind.fill( POBLA_1985 , POBLA_1995 , POBLA_2005 , POBLA_2020 ) ; rm(POBLA_1985 , POBLA_1995 , POBLA_2005 , POBLA_2020 )


### Descripción -------
head(POBLA)
str(POBLA , list.len= 268)
skimr::skim(POBLA)

?str()

table(POBLA$ÁREA.GEOGRÁFICA , useNA = "always")


## depuración --------
POBLA = POBLA |>  dplyr::rename("Mujeres_85" = "Mujeres_85.y.más" , "Hombres_85" = "Hombres_85.y.más") |> 
  dplyr::select(-starts_with("Total")) |> ## Filtramos todos aquellos vectores que inician con Total.
   dplyr::filter(MPIO_CDPMP == "63001") |> ## Dejamos solo Armenia.
  dplyr::select(-c(DP , DPNOM , MUNICIPIO)) ## Solo lar variables que necesitamos.


## Transponemos la base de datos. 
POBLA = POBLA |> reshape::melt( id=c("MPIO_CDPMP" , "ÁREA.GEOGRÁFICA" ,"AÑO" ) , variable_name = "EDAD"  )

# Separamos.
POBLA = POBLA |> separate(EDAD, c("SEXO", "EDAD" ), "_")


# Proyecciones Historicas-------------
print("1- Población total")
POBLA |> dplyr::filter( ÁREA.GEOGRÁFICA == "Total" ) |> group_by(AÑO) |> 
  summarise(POPULATION = sum(value)) |> #View()
  ggplot( aes(x = as.Date(as.character( paste0( as.character(AÑO) , "-12-31"))) , y = POPULATION )) + 
  geom_line(colour = "#26619C", size = 1) +
  scale_x_date(date_breaks = "5 year", 
               #labels=date_format("%Y"),
               limits = as.Date(c('1985-12-31','2035-12-31')), date_labels="%Y" ) +
  labs(title = "",
       x = "Año",
       y = "Población") +
  theme_minimal()


print("2- Población total según sexo") 
POBLA |> dplyr::filter( ÁREA.GEOGRÁFICA == "Total" ) |> group_by(AÑO , SEXO) |> 
  summarise(POPULATION = sum(value)) |> 
  ggplot( aes(x = as.Date(as.character( paste0( as.character(AÑO) , "-12-31"))) , y = POPULATION )) + 
  geom_line(aes(color = SEXO ), size = 1.5) +
  scale_x_date(date_breaks = "5 year", 
               #labels=date_format("%Y"),
               limits = as.Date(c('1985-12-31','2035-12-31')), date_labels="%Y" ) +
  labs(title = "",
       x = "Año",
       y = "Población" ,
       colour = "Sexo") +
  scale_color_manual(values = c("#26619C", "#CF1020")) +
  theme_minimal()


## Piramide poblacional --------
# Creamos una nueva variables con las etiquetas de kas edades quinquenales.
POBLA = POBLA |> mutate(EDAD = as.numeric(EDAD)) |> # Recodifico la edad como numerica.
  mutate( EDAD = factor(car::recode(EDAD, "0:4=1; 5:9=2; 10:14=3;
                                            15:19=4; 20:24=5; 25:29=6; 30:34=7;
                                              35:39=8; 40:44=9; 45:49=10; 50:54=11; 
                                           55:59=12; 60:64=13; 65:69=14; 
                                           70:74=15; 75:79=16; 80:84=17; 85=18") , 
                        labels = c("0-4", "5-9", "10-14", # Etiqueto los grupos
                                   "15-19", "20-24", "25-29", "30-34",
                                   "35-39", "40-44", "45-49",
                                   "50-54", "55-59", "60-64", "65-69",
                                   "70-74", "75-79", "80-84",
                                   "85-Más"))) 



# Generamos otro objeto que es la agrupación del total de personas para sacar una muestra depurada de solo que vamos a utilizar.
POBLA_1 = POBLA |> dplyr::rename( "AREA" = "ÁREA.GEOGRÁFICA") |> 
  group_by(MPIO_CDPMP , AREA , AÑO , SEXO , EDAD) |>  
  summarise( PERSONAS = sum(value)) |>
  dplyr::filter( AREA == "Total" &  AÑO == 1985)


## Si le aparece un error que le exprese que no encuentra la variable "AREA" o "ÁREA.GEOGRÁFICA en el código anterior digite el siguiente código.
#POBLA_1 = POBLA |> 
 #   dplyr::rename("AREA" = "ÁREA.GEOGRÁFICA") |> 
  #  dplyr::filter(AREA == "Total" & AÑO == 1985) |> 
   # dplyr::group_by(MPIO_CDPMP, AREA, AÑO, GENERO, EDAD) |> 
    #dplyr::summarise(PERSONAS = sum(value)) |> 
     #dplyr::ungroup()
  

# Gráfica
print("3- Priamide poblacional de Armenia para el año 1985" ) 
ggplot(POBLA_1 ,aes(x =EDAD , y = PERSONAS ,fill = SEXO )) + 
  geom_col(data = subset( POBLA_1 , SEXO == "Hombres") |>   mutate( PERSONAS = -PERSONAS), width = 0.9,
           fill = "#26619C") + geom_col(data = subset(POBLA_1, SEXO == "Mujeres"),
                                        width = 0.9, fill = "#CF1020") + coord_flip() +
  labs(title = "",
       x = "Edad en Quinquenales",
       y = "Hombres                        Mujeres",
       caption = "") +
  scale_y_continuous(breaks = seq(-14000, 14000, by = 1000), 
                     labels = paste0(c(seq(-14000, 0, by = 1000)*-1, seq(1000, 14000, by = 1000)))) +
  theme_minimal()


print("Quiz: Seleccione el municipio de xxxx y saque la piramide para el año xxxx")

