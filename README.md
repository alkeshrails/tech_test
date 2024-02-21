=> Welcome to the tech_test repository. This guide will help you set up and run the project locally.

=> Make sure you have the following installed on your system.
- Ruby version 3.0.0
- Rails version: 7.0.8

## Getting Started

(1) Clone this repository to your local machine:
        `git clone git@github.com:alkeshrails tech_test.git`
        
=> Change into the project directory: `cd tech_test

=> Install gem dependencies:
        'bundle install'
        
=> Follow these steps to setup the database :

    * rails db:create (Create new database).
    
    * rails db:migrate (To run migrations).
    
    * rails db:seed (Seed the database with sample data)

 ## Running the Test Cases
  => To ensure the functionality of the application, you can run the test suite using the following command:
      Run 'bundle exec rspec'
