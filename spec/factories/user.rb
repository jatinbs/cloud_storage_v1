FactoryGirl.define do
  factory :user do
    name "John Doe"
    email "john.doe@example.com"
    password_digest User.digest('password')
    password_digest User.digest('password')
  end
end