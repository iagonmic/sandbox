library(readr)

# Criar dados de exemplo
school_data <- data.frame(
  StudentID = 1:10,
  Name = c("Alice", "Bob", "Charlie", "David", "Eve", "Frank", "Grace", "Hannah", "Ivy", "Jack"),
  Math = c(80, 90, 85, 70, 60, 55, 95, 40, 50, 65),
  Science = c(70, 85, 80, 60, 55, 50, 90, 45, 65, 60),
  English = c(90, 80, 70, 85, 75, 65, 95, 50, 60, 55),
  History = c(60, 70, 65, 55, 80, 75, 85, 60, 45, 50),
  PhysicalEducation = c(100, 95, 90, 85, 80, 70, 60, 75, 65, 55)
)

# Salvar como CSV
write_csv(school_data, "data/school_data_exercise_3.csv")
