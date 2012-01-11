FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password "123456"
    password_confirmation "123456"
    admin false
  end
end