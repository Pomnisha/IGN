
FactoryGirl.define do
  factory :shop, :class => Refinery::Shops::Shop do
    sequence(:url) { |n| "refinery#{n}" }
  end
end

