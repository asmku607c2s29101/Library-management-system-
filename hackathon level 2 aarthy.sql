CREATE DATABASE lib30;
USE lib30;
CREATE TABLE authors (
  author_id INT AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  birth_date DATE,
  death_date DATE,
  biography TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (author_id)
);
CREATE TABLE publishers (
  publisher_id INT AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  address VARCHAR(200) NOT NULL,
  city VARCHAR(50) NOT NULL,
  state VARCHAR(50) NOT NULL,
  country VARCHAR(50) NOT NULL,
  postal_code VARCHAR(10) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (publisher_id)
);
CREATE TABLE books (
  book_id INT AUTO_INCREMENT,
  title VARCHAR(200) NOT NULL,
  subtitle VARCHAR(200),
  author_id INT,
  publisher_id INT,
  publication_date DATE NOT NULL,
  isbn VARCHAR(20) NOT NULL,
  price DECIMAL(10, 2) NOT NULL,
  description TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (book_id),
  FOREIGN KEY (author_id) REFERENCES authors(author_id),
  FOREIGN KEY (publisher_id) REFERENCES publishers(publisher_id)
);
CREATE TABLE borrowers (
  borrower_id INT AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL,
  phone VARCHAR(20) NOT NULL,
  address VARCHAR(200) NOT NULL,
  city VARCHAR(50) NOT NULL,
  state VARCHAR(50) NOT NULL,
  country VARCHAR(50) NOT NULL,
  postal_code VARCHAR(10) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (borrower_id)
);
CREATE TABLE loans (
  loan_id INT AUTO_INCREMENT,
  book_id INT,
  borrower_id INT,
  loan_date DATE NOT NULL,
  due_date DATE NOT NULL,
  return_date DATE,
  fine DECIMAL(10, 2),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (loan_id),
  FOREIGN KEY (book_id) REFERENCES books(book_id),
  FOREIGN KEY (borrower_id) REFERENCES borrowers(borrower_id)
);
INSERT INTO authors (first_name, last_name, birth_date, death_date, biography)
VALUES
('John', 'Doe', '1990-01-01', NULL, 'Sample author biography'),
('Jane', 'Doe', '1995-06-01', NULL, 'Sample author biography');

INSERT INTO publishers (name, address, city, state, country, postal_code)
VALUES
('Sample Publisher', '123 Main St', 'New York', 'NY', 'USA', '10001'),
('Another Publisher', '456 Broadway', 'Los Angeles', 'CA', 'USA', '90001');

INSERT INTO books (title, subtitle, author_id, publisher_id, publication_date, isbn, price, description)
VALUES
('Sample Book', 'Subtitle', 1, 1, '2020-01-01', '1234567890', 19.99, 'Sample book description'),
('Another Book', NULL, 2, 2, '2021-06-01', '9876543210', 14.99, 'Another book description');

INSERT INTO borrowers (first_name, last_name, email, phone, address, city, state, country, postal_code)
VALUES
('John', 'Smith', 'john.smith@example.com', '123-456-7890', '123 Main St', 'New York', 'NY', 'USA', '10001'),
('Jane', 'Smith', 'jane.smith@example.com', '987-654-3210', '456 Broadway', 'Los Angeles', 'CA', 'USA', '90001');

INSERT INTO loans (book_id, borrower_id, loan_date, due_date, return_date, fine)
VALUES
(1, 1, '2022-01-01', '2022-01-15', '2022-01-10', 0.00),
(2, 2, '2022-06-01', '2022-06-15', NULL, 0.00);
select*from authors;