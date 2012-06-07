# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Companies" do
    describe "Admin" do
      describe "companies" do
        login_refinery_user

        describe "companies list" do
          before(:each) do
            FactoryGirl.create(:company, :url => "UniqueTitleOne")
            FactoryGirl.create(:company, :url => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.companies_admin_companies_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.companies_admin_companies_path

            click_link "Add New Company"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Url", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Companies::Company.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Url can't be blank")
              Refinery::Companies::Company.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:company, :url => "UniqueTitle") }

            it "should fail" do
              visit refinery.companies_admin_companies_path

              click_link "Add New Company"

              fill_in "Url", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Companies::Company.count.should == 1
            end
          end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:company, :url => "A url") }

          it "should succeed" do
            visit refinery.companies_admin_companies_path

            within ".actions" do
              click_link "Edit this company"
            end

            fill_in "Url", :with => "A different url"
            click_button "Save"

            page.should have_content("'A different url' was successfully updated.")
            page.should have_no_content("A url")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:company, :url => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.companies_admin_companies_path

            click_link "Remove this company forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Companies::Company.count.should == 0
          end
        end

      end
    end
  end
end
