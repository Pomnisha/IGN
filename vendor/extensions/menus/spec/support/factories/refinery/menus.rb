
FactoryGirl.define do
  factory :menu, :class => Refinery::Menus::Menu do
    sequence(:type) { |n| "refinery#{n}" }
  end
end

