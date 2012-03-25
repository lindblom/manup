#coding:UTF-8

require "spec_helper"

describe "As admin" do
  
  it "you should be able to login with right credentials" do
    visit login_path
    fill_in "Username", with: ENV["admin_user"]
    fill_in "Password", with: ENV["admin_password"]
    click_button "Logga in"
    page.should have_content("Du är nu inloggad som admin")
  end
  
  it "should not be able to login with wrong cridentials" do
    visit login_path
    fill_in "Username", with: ENV["admin_user"].reverse
    fill_in "Password", with: ENV["admin_password"]
    click_button "Logga in"
    page.should have_content("Felaktiga uppgifter angivna")
  end
  
  it "you should see the admin menu items" do
    visit root_path
    page.should have_css(".admin-item")
  end
end