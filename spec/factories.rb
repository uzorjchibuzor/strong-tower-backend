
FactoryBot.define do
  factory(:user) do
    email { 'abc@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
    last_name { 'doe' } 
    first_name { 'john' }
    role { 'patient' }
  end
end