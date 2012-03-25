require "spec_helper.rb"

describe "Essays" do
  let(:essay) { Factory(:essay) }
  
  before :each do
    essay
  end
  
  context "on homepage" do
    it "should show title" do
      visit root_path
      page.should have_content(essay.title)
    end
    
    it "should show ingress" do
      visit root_path
      page.should have_content(essay.ingress)
    end
  end
  
  it "should be linked from front page" do
    visit root_path
    click_link essay.title
    current_path.should == essay_path(essay)
  end
  
  it "should not be able to edit" do
    visit edit_admin_essay_path(essay)
    current_path.should eql(login_path)
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