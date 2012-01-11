# Freedom - Mind-blowing issue tracker.
# Veselin Todorov <hi@vesln.com>
# MIT License

FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password '123456'
    password_confirmation '123456'
    admin false
  end
  
  factory :admin, :class => User do
    email "administrator@example.com"
    password '123456'
    password_confirmation '123456'
    admin true
  end
  
  factory :project do
    name 'Example project'
    description 'Example description'
  end
end