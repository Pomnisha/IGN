# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Menus" do
    describe "Admin" do
      describe "menus" do
        login_refinery_user

        describe "menus list" do
          before(:each) do
            FactoryGirl.create(:menu, :type => "UniqueTitleOne")
            FactoryGirl.create(:menu, :type => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.menus_admin_menus_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.menus_admin_menus_path

            click_link "Add New Menu"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Type", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Menus::Menu.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Type can't be blank")
              Refinery::Menus::Menu.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:menu, :type => "UniqueTitle") }

            it "should fail" do
              visit refinery.menus_admin_menus_path

              click_link "Add New Menu"

              fill_in "Type", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Menus::Menu.count.should == 1
            end
          end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:menu, :type => "A type") }

          it "should succeed" do
            visit refinery.menus_admin_menus_path

            within ".actions" do
              click_link "Edit this menu"
            end

            fill_in "Type", :with => "A different type"
            click_button "Save"

            page.should have_content("'A different type' was successfully updated.")
            page.should have_no_content("A type")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:menu, :type => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.menus_admin_menus_path

            click_link "Remove this menu forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Menus::Menu.count.should == 0
          end
        end

      end
    end
  end
end
