require 'spec_helper'

module Refinery
  module Shops
    describe Shop do
      describe "validations" do
        subject do
          FactoryGirl.create(:shop,
          :url => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:url) { should == "Refinery CMS" }
      end
    end
  end
end
