#coding:utf-8
require "spec_helper"

describe "Resources" do
  it "should be linked to in menu" do
    visit root_path
    click_link "Resurser"
    current_path.should == resources_path
  end
  
  context "should contain" do
    
    before :each do
      visit resources_path
    end
    
    it "podcasts" do
      page.should have_css("h2", text: "Podcasts")
    end
    
    it "books" do
      page.should have_css("h2", text: "Böcker")
    end
  end
end