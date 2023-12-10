# README

Setting up a Ruby on Rails Appointment Management Application

Introduction


This guide provides step-by-step instructions on how to set up a local instance of a Ruby on Rails application for managing doctor-patient appointments. The application uses MySQL Lite as the database. The roles include doctors, patients, and administrators.

Prerequisites


Make sure you have the following software installed on your system:
    • Ruby (version 3.2.0)
    • Ruby on Rails (version 7.0.8)
    • MySQL Lite
    
Installation Steps
1. Clone the Repository
bashCopy code
git clone https://github.com/your-username/doctor_appointments.git
cd doctor_appointments
Save to grepper
2. Install Dependencies
bashCopy code
bundle install
Save to grepper
3. Configure Database
Update the config/database.yml file with the appropriate database configuration for MySQL Lite:
yamlCopy code
default: &default
  adapter: sqlite3
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  timeout: 5000
development:
  <<: *default
  database: db/development.sqlite3
Add similar configurations for test and production environments
Save to grepper
4. Create and Migrate the Database
bashCopy code
rails db:create
rails db:migrate
Save to grepper
5. Seed the Database (Optional)
If you want to populate the database with sample data:
bashCopy code
rails db:seed
Save to grepper
6. Start the Rails Server
bashCopy code
rails server
Save to grepper

The application should now be running locally at http://localhost:3000.

Usage
    • Visit http://localhost:3000 in your web browser.
    • Sign up as an administrator to manage user roles.
    • Doctors and patients can sign up and log in.
    • Doctors can view appointments.
    • Patients can create appointments and view their own appointments.
    • Accounts made for tests purposes (you can create more accounts in the Sign Up option):
        ◦ Administrator: admin1@gmail.com / 123456
        ◦ Patient: patient_1@gmail.com / 123456
        ◦ Doctor: doctor1@gmail.com / 123456

Conclusion
You have now successfully set up a local instance of the appointment management application using Ruby on Rails and MySQL Lite.

