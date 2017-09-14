FactoryGirl.define do
  factory :sushi_roll do
    name "Vegas Roll"
    fish_type "Salmon"
    price (0..120).to_a.sample
    spicy true
    user
  end
end