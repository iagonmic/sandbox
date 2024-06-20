library(readr)

# Criar dados de exemplo
sales_data <- data.frame(
  OrderID = 1:10,
  Product = c("Laptop", "Mouse", "Keyboard", "Monitor", "Printer", "Tablet", "Headphones", "Webcam", "Desk", "Chair"),
  Category = c("Electronics", "Accessories", "Accessories", "Electronics", "Electronics", "Electronics", "Accessories", "Accessories", "Furniture", "Furniture"),
  Quantity = c(1, 5, 3, 2, 1, 2, 4, 2, 1, 1),
  Price = c(1000, 20, 50, 150, 200, 300, 30, 50, 100, 200),
  Date = as.Date(c("2023-01-10", "2023-02-15", "2023-03-20", "2023-04-25", "2023-05-30", "2023-06-05", "2023-07-10", "2023-08-15", "2023-09-20", "2023-10-25"))
)

# Salvar como CSV
write_csv(sales_data, "data/sales_data_exercise_1.csv")
