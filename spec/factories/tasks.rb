#++
# Freedom - Mind-blowing issue tracker.
#
# http://github.com/vesln/freedom
# Veselin Todorov <hi@vesln.com>
# MIT License
#--

FactoryGirl.define do
  factory :task do
    title "MyString"
    description 'Awesome project'
    milestone_id 1
    assigned_user_id 1
    state "new"
    project_id 1
    user_id 1

    factory :completed_task do
      state "resolved"
    end

    factory :open_task do
      state "open"
    end
  end
end
