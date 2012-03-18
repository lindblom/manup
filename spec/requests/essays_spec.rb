require "spec_helper.rb"

describe "Essays" do
  let(:essay) { Factory(:essay) }
  
  before :each do
    essay
  end
  
  it "should be shown on homepage" do
    visit root_path
    page.should have_content(essay.title)
  end
  
  it "should be linked from front page" do
    visit root_path
    click_link essay.title
    current_path.should == essay_path(essay)
  end
  
  context "when viewing" do
    before :each do
      visit essay_path(essay)
    end
    
    it "should have the right title" do
      page.should have_css("head title", text: essay.title)
    end
    
    it "should show the body text" do
      page.should have_content(essay.body)
    end
  end
end