# README

<h1>Setting up a Ruby on Rails Appointment Management Application</h1>

<h3>Introduction</h3>
This guide provides step-by-step instructions on how to set up a local instance of a Ruby on Rails application for managing doctor-patient appointments. The application uses MySQL Lite as the database. The roles include doctors, patients, and administrators.

<h3>Prerequisites</h3>
Make sure you have the following software installed on your system:<br>
    • Ruby (version 3.2.0)<br>
    • Ruby on Rails (version 7.0.8)<br>
    • MySQL Lite

<h3>Installation Steps</h3>
1. Clone the Repository<br>
bashCopy code<br>
git clone https://github.com/your-username/doctor_appointments.git<br>
cd doctor_appointments<br>
Save to grepper<br><br>
2. Install Dependencies<br>
bashCopy code<br>
bundle install<br>
Save to grepper<br><br>
3. Configure Database<br>
Update the config/database.yml file with the appropriate database configuration for MySQL Lite:<br>
yamlCopy code<br>
default: &default<br>
  adapter: sqlite3<br>
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %><br>
  timeout: 5000<br>
development:<br>
  <<: *default<br>
  database: db/development.sqlite3<br>
Add similar configurations for test and production environments<br>
Save to grepper<br><br>
4. Create and Migrate the Database<br>
bashCopy code<br>
rails db:create<br>
rails db:migrate<br>
Save to grepper<br><br>
5. Seed the Database (Optional)<br>
If you want to populate the database with sample data:<br>
bashCopy code<br>
rails db:seed<br>
Save to grepper<br><br>
6. Start the Rails Server<br>
bashCopy code<br>
rails server<br>
Save to grepper<br><br>

<b>The application should now be running locally at http://localhost:3000.</b><br>

<h3>Usage</h3>
    • Visit http://localhost:3000 in your web browser.<br>
    • Sign up as an administrator to manage user roles.<br>
    • Doctors and patients can sign up and log in.<br>
    • Doctors can view appointments.<br>
    • Patients can create appointments and view their own appointments.<br><br>
Accounts made for tests purposes (you can create more accounts in the Sign Up option):<br>
        ◦ Administrator: admin1@gmail.com / 123456<br>
        ◦ Patient: patient_1@gmail.com / 123456<br>
        ◦ Doctor: doctor1@gmail.com / 123456<br>

<h3>Conclusion</h3>
You have now successfully set up a local instance of the appointment management application using Ruby on Rails and MySQL Lite.

