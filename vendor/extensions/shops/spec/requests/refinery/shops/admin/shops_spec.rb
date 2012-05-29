# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Shops" do
    describe "Admin" do
      describe "shops" do
        login_refinery_user

        describe "shops list" do
          before(:each) do
            FactoryGirl.create(:shop, :url => "UniqueTitleOne")
            FactoryGirl.create(:shop, :url => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.shops_admin_shops_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.shops_admin_shops_path

            click_link "Add New Shop"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Url", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Shops::Shop.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Url can't be blank")
              Refinery::Shops::Shop.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:shop, :url => "UniqueTitle") }

            it "should fail" do
              visit refinery.shops_admin_shops_path

              click_link "Add New Shop"

              fill_in "Url", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Shops::Shop.count.should == 1
            end
          end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:shop, :url => "A url") }

          it "should succeed" do
            visit refinery.shops_admin_shops_path

            within ".actions" do
              click_link "Edit this shop"
            end

            fill_in "Url", :with => "A different url"
            click_button "Save"

            page.should have_content("'A different url' was successfully updated.")
            page.should have_no_content("A url")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:shop, :url => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.shops_admin_shops_path

            click_link "Remove this shop forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Shops::Shop.count.should == 0
          end
        end

      end
    end
  end
end
