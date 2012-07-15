
FactoryGirl.define do
  factory :topic, :class => Refinery::Topics::Topic do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

