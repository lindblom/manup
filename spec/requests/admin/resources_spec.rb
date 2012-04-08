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
  
  it "podcasts should be createable" do
    visit root_path
    click_link "Lägg till resurs"
    title = "Resource 1"
    fill_in "Titel", with: title
    fill_in "Beskrivning", with: "Description 1"
    fill_in "Url", with: "http://www.example.com"
    select "Podcast", from: "Kategori"
    click_button "Lägg till"
    Resource.count.should eql(1)
    page.should have_content("Din resurs har lagts till")
    page.should have_content(title)
  end
  
  it "books should be createable" do
    visit root_path
    click_link "Lägg till resurs"
    title = "Resource 1"
    fill_in "Titel", with: title
    fill_in "Beskrivning", with: "Description 1"
    fill_in "Url", with: "http://www.example.com"
    select "Bok", from: "Kategori"
    click_button "Lägg till"
    Resource.count.should eql(1)
    page.should have_content("Din resurs har lagts till")
    page.should have_content(title)
  end
  
  it "should be editable" do
    Factory(:podcast)
    visit resources_path
    within("#podcasts") do
      click_link "Ändra"
    end
    new_title = "Ny Titel"
    fill_in "Titel", with: new_title
    click_button "Uppdatera"
    page.should have_content("Resursen är uppdaterad")
    page.should have_content(new_title)
  end
  
  it "should be deletable" do
    Factory(:podcast)
    visit resources_path
    within("#podcasts") do
      click_link "Ta bort"
    end
    current_path.should == resources_path
    page.should have_content("Resursen borttagen")
    Resource.count.should eql(0)
  end
end