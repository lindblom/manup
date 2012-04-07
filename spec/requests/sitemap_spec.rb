require "spec_helper.rb"

describe "Sitemap" do
  it "should exist" do
    get "/sitemap"
    assert_response 200
  end
  
  context "content" do
    it "should include root" do
      visit "/sitemap"
      page.should have_css("loc", text: root_url)
    end
    
    it "should include essays listing" do
      visit "/sitemap"
      page.should have_css("loc", text: essays_url)
    end
    
    it "should include resources listing" do
      visit "/sitemap"
      page.should have_css("loc", text: resources_url)
    end
  
    it "should include essays" do
      essay = Factory(:essay)
      visit "/sitemap"
      page.should have_css("loc", text: essay_url(essay))
    end
  
    it "should not include unpublished essays" do
      essay = Factory(:essay, {published: false})
      visit "/sitemap"
      page.should_not have_css("loc", text: essay_url(essay))
    end
  end
end