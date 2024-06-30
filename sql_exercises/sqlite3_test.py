import sqlite3

# Connecting to database
conn = sqlite3.connect('sql_exercises/sqlite3_test.db')
cursor = conn.cursor()

# Creating table
cursor.execute('''
    CREATE TABLE IF NOT EXISTS Users (
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        age INTEGER
        )
''')

# Inserting data
cursor.execute("INSERT INTO Users (name, age) VALUES ('Alice', 30);")
cursor.execute("INSERT INTO Users (name, age) VALUES ('Bob', 25);")

# Commit to save changes
conn.commit()

# Consulting data
cursor.execute("SELECT * FROM Users")
results = cursor.fetchall()

# Printing results
for row in results:
    print(f"ID: {row[0]}, Name: {row[1]}, Age: {row[2]}")

conn.close()