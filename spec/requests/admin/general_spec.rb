require "spec_helper"

describe "As admin" do
  it "you should see the admin menu items" do
    visit root_path
    page.should have_css(".admin-item")
  end
end