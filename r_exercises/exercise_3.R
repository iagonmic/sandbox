# Tarefas:
library(dplyr)

# Carregar os dados do arquivo CSV.
df_school <- readr::read_csv(file = "data/3_school_data.csv")

# Calcular a média de cada aluno em todas as disciplinas.
df_school <- df_school %>% 
  rowwise() %>% 
  dplyr::mutate(total_mean = mean(c(Math, Science, English, History, PhysicalEducation))) %>% 
  ungroup()

# Adicionar uma coluna indicando se o aluno está "Aprovado" (média >= 60) ou "Reprovado" (média < 60).
df_school <- df_school %>%
  dplyr::mutate(result = ifelse(total_mean >= 60, "Aprovado", "Reprovado"))

# Filtrar apenas os alunos "Reprovados".
df_school %>% dplyr::filter(result == "Reprovado")

# Calcular a média por disciplina (Math, Science, English, History, PhysicalEducation) para toda a turma.
means <- df_school %>%
  dplyr::select(c(Math, Science, English, History, PhysicalEducation)) %>% 
  dplyr::summarise(across(everything(), mean))

# Encontrar o aluno com a maior média geral.
df_school %>% 
  dplyr::slice_max(total_mean, n = 1)

# Adicionar uma coluna com a média ponderada das disciplinas (considere pesos diferentes para cada disciplina, ex.: Math - 2, Science - 1.5, etc.).
weights <- c(Math = 0.2, Science = 0.15, English = 0.3, History = 0.25, PhysicalEducation = 0.1)

df_school <- df_school %>% 
  rowwise() %>%
  dplyr::mutate(w_mean = sum(c_across(Math:PhysicalEducation) * weights)/ sum(weights)) %>%
  ungroup()

# Determinar quantos alunos estão "Aprovados" e quantos estão "Reprovados".
df_school %>%
  dplyr::group_by(result) %>% 
  dplyr::summarise(quantidade = n())
  
  
# Salvar o resultado em um novo arquivo CSV.
readr::write_csv(df_school, file = "data/3_school_data_new.R")
