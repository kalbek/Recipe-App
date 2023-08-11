# test/factories/users.rb
FactoryBot.define do
  factory :user do
    name { 'User Name' }
    email { 'user@example.com' }
    password { 'password' }
    # Other attributes
  end
end
