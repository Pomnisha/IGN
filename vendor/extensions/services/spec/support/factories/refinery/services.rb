
FactoryGirl.define do
  factory :service, :class => Refinery::Services::Service do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

