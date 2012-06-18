
FactoryGirl.define do
  factory :banner, :class => Refinery::Banners::Banner do
    sequence(:banner_type) { |n| "refinery#{n}" }
  end
end

