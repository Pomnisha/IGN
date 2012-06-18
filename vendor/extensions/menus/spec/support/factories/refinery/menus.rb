
FactoryGirl.define do
  factory :menu, :class => Refinery::Menus::Menu do
    sequence(:menu_type) { |n| "refinery#{n}" }
  end
end

