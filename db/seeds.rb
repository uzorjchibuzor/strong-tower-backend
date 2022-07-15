# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

doctor = Doctor.create(name: Faker::Name.name, email: Faker::Internet.email)

100.times do |count|
  user = User.create(first_name: Faker::Name.unique.first_name, last_name: Faker::Name.unique.last_name, email: "abc#{count}@123.com", password: "123456", password_confirmation: "123456")
  Appointment.create(date: Faker::Time.forward(days: 23, period: :morning), user: user, doctor: doctor)
end
