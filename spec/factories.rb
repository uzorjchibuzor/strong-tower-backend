
FactoryBot.define do
  factory(:user) do
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
    last_name { Faker::Name.first_name } 
    first_name { Faker::Name.last_name }
    role { 'patient' }
  end

  factory(:doctor) do
    name { Faker::Name.name }
    email { Faker::Internet.email }
  end

  factory(:appointment) do
    date { Faker::Time.forward(days: 5, period: :morning) }
    user
    doctor
  end
end