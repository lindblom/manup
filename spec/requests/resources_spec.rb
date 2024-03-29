#coding:utf-8
require "spec_helper"

describe "Resources" do
  let(:podcast) { Factory :podcast }
  let(:book) { Factory :book }
  
  it "should be linked to in menu" do
    visit root_path
    click_link "Resurser"
    current_path.should == resources_path
  end
  
  it "should not have delete links" do
    podcast
    book
    visit resources_path
    page.should_not have_css("a", text: "Ta bort")
  end
  
  context "on front-page" do
    it "should show total books count" do
      3.times { Factory(:book) }
      visit root_path
      page.should have_css("#book-count", text: Resource.books.count.to_s)
    end
    
    it "should show total podcasts count" do
      3.times { Factory(:podcast) }
      visit root_path
      page.should have_css("#podcast-count", text: Resource.podcasts.count.to_s)
    end
    
    it "should show the latest books" do
      old_book = Factory(:book)
      books = 3.times.map { Factory(:book) }
      visit root_path
      within("#latest-books") do
        books.each { |book| page.should have_content(book.title) }
        page.should_not have_content(old_book.title)
      end
    end
    
    it "should show the latest podcasts" do
      old_podcast = Factory(:podcast)
      podcasts = 3.times.map { Factory(:podcast) }
      visit root_path
      within("#latest-podcasts") do
        podcasts.each { |podcast| page.should have_content(podcast.title) }
        page.should_not have_content(old_podcast.title)
      end
    end
  end
  
  context "should contain" do
    
    before :each do
      podcast
      book
      visit resources_path
    end
    
    it "podcasts" do
      page.should have_css("h1", text: "Podcasts")
      within("#podcasts") do
        page.should have_content(podcast.title)
      end
    end
    
    it "books" do
      page.should have_css("h1", text: "Böcker")
      within("#books") do
        page.should have_content(book.title)
      end
    end
  end
end