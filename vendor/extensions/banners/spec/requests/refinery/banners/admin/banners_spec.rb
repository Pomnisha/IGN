# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Banners" do
    describe "Admin" do
      describe "banners" do
        login_refinery_user

        describe "banners list" do
          before(:each) do
            FactoryGirl.create(:banner, :banner_type => "UniqueTitleOne")
            FactoryGirl.create(:banner, :banner_type => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.banners_admin_banners_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.banners_admin_banners_path

            click_link "Add New Banner"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Type", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Banners::Banner.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Type can't be blank")
              Refinery::Banners::Banner.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:banner, :banner_type => "UniqueTitle") }

            it "should fail" do
              visit refinery.banners_admin_banners_path

              click_link "Add New Banner"

              fill_in "Type", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Banners::Banner.count.should == 1
            end
          end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:banner, :banner_type => "A type") }

          it "should succeed" do
            visit refinery.banners_admin_banners_path

            within ".actions" do
              click_link "Edit this banner"
            end

            fill_in "Type", :with => "A different type"
            click_button "Save"

            page.should have_content("'A different type' was successfully updated.")
            page.should have_no_content("A type")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:banner, :banner_type => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.banners_admin_banners_path

            click_link "Remove this banner forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Banners::Banner.count.should == 0
          end
        end

      end
    end
  end
end
