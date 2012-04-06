require "spec_helper.rb"

describe "Essays" do
  let(:essay) { Factory(:essay) }
  
  before :each do
    essay
  end
  
  it "should be included in main menu" do
    visit root_path
    page.should have_css("a", text: "Artiklar")
  end
  
  it "unpublished should not be showing on essays_path" do
    unpublished_essay = Factory(:essay, {published: false})
    visit essays_path
    page.should_not have_content(unpublished_essay.title)
  end
  
  it "should all be showing on essays_path" do
    essays = 5.times.map { Factory(:essay) }
    essays << essay
    visit essays_path
    essays.each do |essay|
      page.should have_content(essay.title)
    end
  end
  
  it "should not be able to edit" do
    visit edit_admin_essay_path(essay)
    current_path.should eql(login_path)
  end
  
  context "on homepage" do
    it "should show total published count" do
      3.times { Factory(:essay) }
      Factory(:essay, {published: false})
      visit root_path
      page.should have_css("#essay-count", text: Essay.published.count.to_s)
    end
    
    it "should show title" do
      visit root_path
      page.should have_content(essay.title)
    end
    
    it "should show ingress" do
      visit root_path
      page.should have_content(essay.ingress)
    end
    
    it "should be linked from front page" do
      visit root_path
      click_link essay.title
      current_path.should == essay_path(essay)
    end
  end
  
  context "when viewing" do
    before :each do
      visit essay_path(essay)
    end
    
    it "should have the right title" do
      page.should have_css("head title", text: essay.title)
    end
    
    it "should show the body text" do
      page.should have_content(essay.ingress)
    end
    
    it "should not show admin functions" do
      page.should_not have_css(".admin-item")
    end
  end
end