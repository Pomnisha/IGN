require 'spec_helper'

module Refinery
  module Deliveries
    describe Delivery do
      describe "validations" do
        subject do
          FactoryGirl.create(:delivery,
          :entity => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:entity) { should == "Refinery CMS" }
      end
    end
  end
end
