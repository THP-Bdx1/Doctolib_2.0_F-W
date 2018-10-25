# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

10.times do
    specialties = Specialty.create!(specialty_name: Faker::Job.position)
end

10.times do
    cities = City.create!(city_name: Faker::Nation.capital_city)
end

5.times do
    doctors=Doctor.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, postal_code: Faker::Address.zip_code, city_id: Random.rand(1..10))
end

15.times do
    patients=Patient.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city_id: Random.rand(1..10))
end

40.times do
    appointments=Appointment.create!(date: Faker::Time.between(70.days.ago, Date.today, :day), doctor_id: Random.rand(1..5), patient_id: Random.rand(1..15))
end


100.times do
    Specialty.find(Random.rand(1..10)).doctors << Doctor.find(Random.rand(1..5))
end