require 'spec_helper'

module Refinery
  module Menus
    describe Menu do
      describe "validations" do
        subject do
          FactoryGirl.create(:menu,
          :menu_type => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:menu_type) { should == "Refinery CMS" }
      end
    end
  end
end
