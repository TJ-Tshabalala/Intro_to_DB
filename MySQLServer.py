import mysql.connector

def create_database(host, user, password, database_name):
    try:
        # Establish a connection to the MySQL server (without specifying a database)
        connection = mysql.connector.connect(
            host=host,
            user=user,
            password=password
        )
        cursor = connection.cursor()

        # Create the database (ignore if it already exists)
        cursor.execute(f"CREATE DATABASE IF NOT EXISTS {alx_book_store")

        print(f"Database '{alx_book_store}' created successfully!")

    except mysql.connector.Error as err:
        print(f"Error: {err}")

    finally:
        # Close the cursor and connection
        if 'cursor' in locals() and cursor is not None:
            cursor.close()
        if 'connection' in locals() and connection is not None and connection.is_connected():
            connection.close()

if __name__ == "__main__":
    # Replace with your MySQL server details
    mysql_host = "localhost"  # Or your server IP/hostname
    mysql_user = "your_mysql_user"
    mysql_password = "your_mysql_password"
    db_name = "alx_book_store"

    create_database(mysql_host, mysql_user, mysql_password, db_name)