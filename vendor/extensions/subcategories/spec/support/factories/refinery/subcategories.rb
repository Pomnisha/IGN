
FactoryGirl.define do
  factory :subcategory, :class => Refinery::Subcategories::Subcategory do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

