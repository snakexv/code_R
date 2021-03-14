spark_available_versions()
spark_installed_versions()


spark_web(slyr)

packageVersion("sparklyr")

sdf_crosstab()   #### table de contingence 


spark_read_csv(sc, "csvfile/", columns = c(x="character", y=`factor`, z=POSIXct)) ### permet de définir les formats des colonnes d'un fichier csv

 # %>% show_query()

library(forcats)
library(ggplot2)

VENTES_M %>% ggplot(aes(as.factor(canal),CA_TTC)) +
  geom_col()



VENTES_M %>% ggplot(aes(as.factor(canal))) +
  geom_col()



#### passage a spark --> garder le nom des colonnes intactes 
options(sparklyr.sanitize.column.names=FALSE)
copy_to(slyr,iris, overwrite = TRUE)


#### pratique pour pls colonnes

VENTES_M %>% group_by(canal) %>% summarise_all(min)


#### percentiles

perc <- VENTES_M %>% sdf_quantile("CA_TTC",liste) 

perc <- explode(perc)

liste=array(c(0.25,0.5,0.75))

class(liste)


################################### nest ???

library(nested)

mtcars


df <- mtcars %>% group_by(am, cyl)
group_vars(df)

mtcars %>% count()
df %>% ungroup() %>% count()

df <- starwars %>% group_by(height, mass)
dv <- group_vars(df)

starwars %>%
  summarise_at(dv, mean, na.rm = TRUE)



by_species <- iris %>%
  group_by(Species)

by_species %>%
  summarise_all(min)


#############################  sparkR

library(magrittr)

ls("package:magrittr")

rnorm(200) %>%
  matrix(ncol = 2) %T>%
  plot %>% # plot usually does not return anything. 
  colSums


iris %>% pivot_wider()

iris_tbl <- copy_to(slyr, iris)



s <- diamonds_tbl %>%
  sdf_pivot(cut ~ color) %>%
  arrange(cut) %>%
  collect() 

diamonds %>%
  mutate(cut = as.character(cut), color = as.character(color)) %>%
  reshape2::dcast(cut ~ color, mean, value.var = "depth") %>%
  arrange(cut) 


mini_iris <- iris_tbl[c(1, 51, 101), ]
# gather Sepal.Length, Sepal.Width, Petal.Length, Petal.Width


iris_tbl %>% gather(key = "attribut", value = "measurement","Sepal_Length")


############################## dossier à supprimer  #####################################



# je n'ai supprimé encore







