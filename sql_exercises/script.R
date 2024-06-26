# Charging necessary libraries
library(DBI)
library(RSQLite)

# Creating connection with SQLite
con <- dbConnect(RSQLite::SQLite(), "sql_exercises/database.sqlite")

# Reading .sql archive's content
sql_commands <- readLines("sql_exercises/create_tables.sql")
sql_query <- trimws(unlist(strsplit(paste(sql_commands, collapse = "\n"), ";")))

# Executing SQL commands
for (statement in sql_query) {
  if (statement != "") {
    DBI::dbExecute(con, statement)
    print(statement)
  }
}

# Verifying Customers table
customers <- dbGetQuery(con, "SELECT * FROM Customers;")
print(customers)

# Verifying Orders table
orders <- dbGetQuery(con, "SELECT * FROM Orders;")
print(orders)

# Verifying Shippings table
shippings <- dbGetQuery(con, "SELECT * FROM Shippings;")
print(shippings)

### First Exercise

# Select client's full name
# Select total orders made by the selected customers
# Print the SUM of the total value ordered by the customer
# Get the status of last order made by customer

# --- The query must be sorted by the total sum of the order values in descending order. ---

DBI::dbGetQuery(con, 
"SELECT (Customers.first_name || ' ' || Customers.last_name) AS full_name,
COUNT(Orders.item) as count_item,
SUM(Orders.amount) as total_value,
Shippings.status
FROM Customers
JOIN Orders ON Customers.customer_id = Orders.customer_id
JOIN Shippings ON Orders.order_id = Shippings.shipping_id
GROUP BY Customers.customer_id
ORDER BY total_value DESC;
")

### Second exercise

# Write a query to identify customers who have not placed orders in the last 8 months. The report should include:

# The customer's full name.
# The date of the last order placed.
# The total amount spent by the customer on all orders.

# --- You can assume that there is an order_date column in the Orders table to represent the date of the order. ---

DBI::dbGetQuery(con,
"SELECT (Customers.first_name || ' ' || Customers.last_name) AS full_name,
Orders.order_date,
SUM(Orders.amount) AS total_value,
julianday(CURRENT_DATE) - julianday(Orders.order_date) AS days_diff
FROM Customers
JOIN Orders ON Customers.customer_id = Orders.customer_id
WHERE days_diff > 240
GROUP BY Customers.customer_id;
")

### Third Exercise

# Write a series of queries to:
  
# Update the status of all shipments to "Delivered" where the customer has placed more than two orders and the sum total of the order values is greater than 1000.
# Check which customers have had their shipping status updated.

DBI::dbGetQuery(con,
"UPDATE Shippings.status
SET 'Pending' = 'Delivered'
WHERE customer_id

")

# Disconnecting from database
DBI::dbDisconnect(con)

