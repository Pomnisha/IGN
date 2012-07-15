require 'spec_helper'

module Refinery
  module Posts
    describe Post do
      describe "validations" do
        subject do
          FactoryGirl.create(:post)
        end

        it { should be_valid }
        its(:errors) { should be_empty }
      end
    end
  end
end
