# Tarefas:
library(dplyr)
library(readr)

# 1.Carregar os dados do arquivo CSV.
df_sales <- readr::read_csv(file = "data/1_sales_data.csv")

# 2.Filtrar as vendas realizadas no ano de 2023.
df_sales <- df_sales %>%
  dplyr::filter(between(Date, as.Date("2023-01-01"), as.Date("2023-12-31")))

# 3.Calcular a receita total (Quantidade * Preço) para cada categoria de produto.
df_sales_by_category <- df_sales %>%
  dplyr::mutate(revenue = Quantity * Price) %>%
  dplyr::group_by(Category) %>%
  dplyr::summarise(
    total_revenue = sum(revenue),
    .groups = "drop"
  )
  
# 4.Ordenar as categorias pela receita total de forma decrescente.
df_sales_by_category <- df_sales_by_category %>%
  dplyr::arrange(desc(total_revenue))

# 5.Encontrar o produto mais vendido (em quantidade) no ano de 2023.
best_selling_product <- df_sales %>%
  dplyr::filter(between(Date, as.Date("2023-01-01"), as.Date("2023-12-31"))) %>%
  dplyr::slice_max(Quantity, n = 1)

# 6.Calcular a média de preço dos produtos vendidos por categoria.
df_sales %>%
  dplyr::group_by(Category) %>%
  dplyr::summarise(mean_price = mean(Price))

# 7.Determinar o mês com a maior receita total.
library(lubridate)
df_sales %>% 
  dplyr::mutate(Month = floor_date(Date, unit = "month")) %>% 
  dplyr::mutate(Revenue = (Quantity*Price)) %>% 
  dplyr::group_by(Month) %>% 
  dplyr::summarise(total_revenue = sum(Revenue), .groups = "drop") %>% 
  dplyr::slice_max(total_revenue, n = 1)
  
# 8.Adicionar uma coluna com o preço total da venda (Quantidade * Preço).
df_sales <- df_sales %>%
  dplyr::mutate(Revenue = (Quantity*Price))

# 9.Salvar o resultado em um novo arquivo CSV.
readr::write_csv(df_sales, "data/1_sales_data_revenue.csv")
