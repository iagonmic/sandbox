# Tarefas:
library(dplyr)
library(readr)

# 1.Carregar os dados do arquivo CSV.
df_survey <- readr::read_csv(file = "data/2_survey_data.csv")

# 2.Remover linhas com dados faltantes (NA).
df_survey <- df_survey %>%
  na.omit()

# 3.Filtrar os respondentes que possuem Age entre 25 e 45 anos.
df_survey_age_25_45 <- df_survey %>% 
  dplyr::filter(between(Age, 25, 45)) # pode ser escrito assim também dplyr::filter(Age >= 25 & Age <= 45)

# 4.Calcular a média de Income por grupo de Gender.
df_survey %>% 
  dplyr::group_by(Gender) %>% 
  dplyr::mutate(income_mean = mean(Income))

# 5.Calcular a mediana da Income por grupo de Gender.
df_survey %>% 
  dplyr::group_by(Gender) %>% 
  dplyr::mutate(income_median = median(Income))

# 6.Filtrar os respondentes com Satisfaction maior ou igual a 4.
df_survey %>% 
  dplyr::filter(Satisfaction >= 4)

# 7.Criar uma nova coluna que classifique Income em categorias (ex.: "Low", "Medium", "High") com base em intervalos definidos.
# Descobrindo o maior income e o menor para calcular os valores definidos =>
# 70.000 - 30.000 = 40.000/3 = 13.333 => mean + 13.333 & mean - 13.333
# df_survey %>% slice_min(Income, n = 3)
# df_survey %>% slice_max(Income, n = 3)

df_survey %>% 
  dplyr::mutate(income_category = case_when(
    Income <= 40416 ~ "Low",
    Income >= 40416 & Income <= 67083 ~ "Medium",
    Income >= 67083 ~ "High"
  ))

# 8.Determinar a idade média dos respondentes que estão "satisfeitos" (Satisfaction >= 4).
df_survey %>% 
  dplyr::filter(Satisfaction >= 4) %>% 
  dplyr::summarise(age_mean = mean(Age))

# 9.Salvar o resultado em um novo arquivo CSV.
readr::write_csv(df_survey, "data/2_survey_data_new.csv")
