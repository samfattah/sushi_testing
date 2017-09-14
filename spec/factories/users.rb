FactoryGirl.define do
  sequence :email do |n|
    "test_#{n}@test.com"
  end

  factory :user do
    first_name "Test"
    last_name "Tester"
    age (0..120).to_a.sample
    gender ['Male', 'Female', 'Other'].sample
    email
    password "password"
  end
end