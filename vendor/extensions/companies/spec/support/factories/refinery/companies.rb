
FactoryGirl.define do
  factory :company, :class => Refinery::Companies::Company do
    sequence(:url) { |n| "refinery#{n}" }
  end
end

