FactoryGirl.define do
  factory :user do
    email "foo@example.com"
    password "123456"
    password_confirmation "123456"
    admin false
  end
end