
FactoryGirl.define do
  factory :banner, :class => Refinery::Banners::Banner do
    sequence(:type) { |n| "refinery#{n}" }
  end
end

