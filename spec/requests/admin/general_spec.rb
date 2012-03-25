#coding:UTF-8

require "spec_helper"

describe "As admin" do
  context "and not logged in" do
    
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
    
    it "should not see the admin menu" do
      visit root_path
      page.should_not have_css(".admin-item")
    end
  end
  
  context "and logged in" do
    before :each do
      admin_login
    end
    
    it "you should see the admin menu items" do
      visit root_path
      page.should have_css(".admin-item")
    end
    
    it "should be able to logout" do
      visit root_path
      click_link "Logga ut"
      page.should have_content("Du har nu blivit utloggad")
      page.should_not have_css(".admin-item")
    end
  end
end