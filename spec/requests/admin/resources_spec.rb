#coding:utf-8
require "spec_helper"

describe "Resources (as admin)" do
  before :each do
    admin_login
  end
  
  it "should have create link in admin menu" do
    visit root_path
    page.should have_css(".admin-item", text: "Lägg till resurs")
  end
end