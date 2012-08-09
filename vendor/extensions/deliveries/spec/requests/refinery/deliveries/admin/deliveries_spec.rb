# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Deliveries" do
    describe "Admin" do
      describe "deliveries" do
        login_refinery_user

        describe "deliveries list" do
          before(:each) do
            FactoryGirl.create(:delivery, :entity => "UniqueTitleOne")
            FactoryGirl.create(:delivery, :entity => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.deliveries_admin_deliveries_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.deliveries_admin_deliveries_path

            click_link "Add New Delivery"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Entity", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Deliveries::Delivery.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Entity can't be blank")
              Refinery::Deliveries::Delivery.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:delivery, :entity => "UniqueTitle") }

            it "should fail" do
              visit refinery.deliveries_admin_deliveries_path

              click_link "Add New Delivery"

              fill_in "Entity", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Deliveries::Delivery.count.should == 1
            end
          end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:delivery, :entity => "A entity") }

          it "should succeed" do
            visit refinery.deliveries_admin_deliveries_path

            within ".actions" do
              click_link "Edit this delivery"
            end

            fill_in "Entity", :with => "A different entity"
            click_button "Save"

            page.should have_content("'A different entity' was successfully updated.")
            page.should have_no_content("A entity")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:delivery, :entity => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.deliveries_admin_deliveries_path

            click_link "Remove this delivery forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Deliveries::Delivery.count.should == 0
          end
        end

      end
    end
  end
end
