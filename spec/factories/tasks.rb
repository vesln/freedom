FactoryGirl.define do
  factory :task do
    title "MyString"
    milestone_id 1
    assigned_user_id 1
    state "new"
    project_id 1
  end
end
