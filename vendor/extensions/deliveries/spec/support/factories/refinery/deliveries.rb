
FactoryGirl.define do
  factory :delivery, :class => Refinery::Deliveries::Delivery do
    sequence(:entity) { |n| "refinery#{n}" }
  end
end

