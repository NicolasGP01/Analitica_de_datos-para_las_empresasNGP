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
             'stringr' , 'stringi' , 'sf' ,
             'viridis' ,'tidyverse'
)


print("IMPORTANTE!! Una vez se asegura que esten instalados llamar la libreria")

sapply(paquetes,require,character.only=T) ; rm(paquetes )


### SECCIÓN DE POBLACIÓN CNPV-----------------------
## Información de las personas
PERSONAS = read.csv(file = "C:/Users/nicol.NICOLAS_GP/Dropbox/Data Bases/Población/CNPV 2018/CNPV2018_5PER_A2_63.CSV") |> 
  mutate(UNO = 1)  |> dplyr::filter( U_MPIO == 1) 

PERSONAS_CASAS = PERSONAS |> group_by(COD_ENCUESTAS) |> summarise( TOTAL = sum(UNO))


## Marco de referencia
MGN = read.csv(file = "C:/Users/nicol.NICOLAS_GP/Dropbox/Data Bases/Población/CNPV 2018/CNPV2018_MGN_A2_63.CSV") |> 
  dplyr::filter(as.numeric(U_MPIO) == 1) |> ##TOMO SOLO A ARMENIA 
  mutate(U_DPTO_1 = as.character(U_DPTO) ,
         U_MPIO_1 = paste0("00",as.character(U_MPIO)) , 
         UA_CLASE_1 = as.character(UA_CLASE) , ## https://stackoverflow.com/questions/5812493/how-to-add-leading-zeros 
         U_SECT_RUR_1 =  str_pad( as.character(U_SECT_RUR) , 3 , pad = "0")  , 
         U_SECC_RUR_1 = paste0("0",as.character(U_SECC_RUR)) , 
         UA2_CPOB_1 = str_pad(as.character(UA2_CPOB) , 3 , pad = "0") ,
         U_SECT_URB_1 = str_pad(as.character(U_SECT_URB) , 4 , pad = "0") ,
         U_SECC_URB_1 = str_pad(as.character(U_SECC_URB) , 2 , pad = "0") ,
         U_MZA_1 = str_pad(as.character(U_MZA) , 2 , pad = "0")) |>
  mutate(manz_ccnct = paste0(U_DPTO_1 , U_MPIO_1 , UA_CLASE_1  , 
                             U_SECT_RUR_1 , U_SECC_RUR_1 , UA2_CPOB_1 , U_SECT_URB_1 , U_SECC_URB_1 ,  U_MZA_1 )) 


# Descriptivos
str(PERSONAS)
skimr::skim(PERSONAS)
str(MGN)
skimr::skim(MGN)

MANZANAS = merge( x = MGN , y = PERSONAS_CASAS , 
                  by = "COD_ENCUESTAS" , 
                  all = T , 
                  suffixes = c('','_PER')) ; rm(MGN , PERSONAS_CASAS)


MANZANAS = MANZANAS |> dplyr::mutate(TOTAL = replace_na( TOTAL, replace = 0 )) |>  group_by(manz_ccnct) |> 
  summarise(TOTAL = sum(TOTAL)) 


# Shape de las manzanas de Armenia 2023
MANZANA_ARMENIA = st_read("C:/Users/nicol.NICOLAS_GP/Dropbox/Información Espacial/MGN_URB_MANZANA.shp") |> 
  dplyr::filter( mpio_cdpmp == "63001")

# Descriptivos
str(MANZANA_ARMENIA)
plot(st_geometry(MANZANA_ARMENIA) , col = "tomato")


MANZANAS_Y_PERSONAS = merge( x = MANZANA_ARMENIA  , y = MANZANAS , 
                             by = "manz_ccnct" , 
                             all.x = TRUE , 
                             suffixes = c('','_PER')) |> mutate(
                               TOTAL = replace_na(TOTAL, 0)
                             ) ; rm(MANZANA_ARMENIA , MANZANAS)


ggplot() + 
  geom_sf(data = MANZANAS_Y_PERSONAS , mapping = aes(fill = TOTAL), show.legend = T) +
  coord_sf() + theme_void()


sum(MANZANAS_Y_PERSONAS$TOTAL)

## Dos formas de guardar un archivo Shape
write_sf( MANZANA_ARMENIA , "C:/Users/nicol.NICOLAS_GP/OneDrive/Escritorio/Portafolio/My Work/Armenia/Alcaldía de Armenia/Observatorio Inmobiliario/ARMENIA_MANZ_CENSAL.shp") 

st_write( MANZANA_ARMENIA , "C:/Users/nicol.NICOLAS_GP/OneDrive/Escritorio/Portafolio/My Work/Armenia/Alcaldía de Armenia/Observatorio Inmobiliario/ARMENIA_MANZ_CENSAL.shp")
