FactoryGirl.define do
  factory :user do
    email "example@example.com"
    password "password"
    password_confirmation "password"
  end
end
