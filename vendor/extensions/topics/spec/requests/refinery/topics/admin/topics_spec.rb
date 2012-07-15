# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Topics" do
    describe "Admin" do
      describe "topics" do
        login_refinery_user

        describe "topics list" do
          before(:each) do
            FactoryGirl.create(:topic, :name => "UniqueTitleOne")
            FactoryGirl.create(:topic, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.topics_admin_topics_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.topics_admin_topics_path

            click_link "Add New Topic"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Topics::Topic.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::Topics::Topic.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:topic, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.topics_admin_topics_path

              click_link "Add New Topic"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Topics::Topic.count.should == 1
            end
          end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:topic, :name => "A name") }

          it "should succeed" do
            visit refinery.topics_admin_topics_path

            within ".actions" do
              click_link "Edit this topic"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:topic, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.topics_admin_topics_path

            click_link "Remove this topic forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Topics::Topic.count.should == 0
          end
        end

      end
    end
  end
end
