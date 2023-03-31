# Project: ASP1 ES GIFI

This is a Ruby on Rails application that aims to create a grading system for students. 
The application uses a MySQL database and has multiple tables to store relevant data. 
The authentication system is implemented using Devise.

## Table of Contents
 [MLC and MLD](https://github.com/robielcpnv/ASP1/tree/main/db)

## Features

- People management (students, teachers, etc.)
- Grade management
- Lecture management
- Category management
- Type of people management
- Semester management
- Promotion/Class management
- Authentication using Devise
- Seed data for all tables

## Setup

### Prerequisites

- Ruby 2.7.0 or later
- Rails 6.0 or later
- MySQL

### Installation

1. Clone the repository:
    ```
    git clone https://github.com/robielcpnv/ASP1.git
    cd ASP1
    ```
2. Install the required gems:
    ```
     bundle install
    ```
3. Set up the database configuration by editing the `config/database.yml` file with your MySQL credentials.

4. Create the database and run the migrations:
    ```
    rails db:create
    rails db:migrate
    ```

5. Seed the database with initial data:
    ```
       rails db:seed
    ```
6. Start the Rails server:
    ```
       rails server
    ```
7. Access the application at http://localhost:3000 in your browser.

## Usage

1. Register or log in to the application using Devise authentication.

2. Navigate through the different sections (People, Grade, Lecture, Category, Type of people, Semester, Promotion/Class) to manage the respective data.

3. Add, edit, or delete records as needed.

4. Use the grading system to assign grades to students for different lectures and semesters.

## Contributing

Feel free to submit issues or pull requests for any bugs or enhancements.

## License

This project is licensed under the MIT License.
