library(readr)

# Criar dados de exemplo
survey_data <- data.frame(
  RespondentID = 1:10,
  Age = c(25, 34, 45, NA, 29, 22, 50, 61, 18, 35),
  Gender = c("Male", "Female", "Female", "Male", "Female", "Male", "Female", "Male", "Female", "Male"),
  Income = c(50000, 60000, 55000, 45000, NA, 48000, 70000, 65000, 30000, 52000),
  Satisfaction = c(5, 4, 3, 2, 1, 5, 4, 3, 2, 1)
)

# Salvar como CSV
write_csv(survey_data, "data/survey_data_exercise_2.csv")
