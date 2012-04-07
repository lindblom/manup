require "spec_helper"

describe "Essays(as admin)" do
  let(:essay) { Factory(:essay) }
  
  before :each do
    admin_login
  end
  
  it "can be created" do
    visit new_admin_essay_path
    fill_in "Body", with: "# Title\nThis is the body"
    click_button "Add"
    Essay.count.should eql(1)
  end
  
  it "can be published" do
    visit new_admin_essay_path
    fill_in "Body", with: "# Title\nThis is the body"
    check "Public"
    click_button "Add"
    Essay.published.count.should eql(1)
  end
  
  it "cant be created without valid data" do
    visit new_admin_essay_path
    click_button "Add"
    Essay.count.should eql(0)
  end
  
  it "can be deleted" do
    visit essay_path(essay)
    click_link "Delete"
    Essay.count.should eql(0)
  end
  
  it "should all be showing on essays_path" do
    essays = 5.times.map { Factory(:essay) }
    essays << Factory(:essay, {published: false})
    visit essays_path
    essays.each do |essay|
      page.should have_content(essay.title)
    end
  end
  
  it "should have unpublished class if unpublished on essays_path" do
    essay = Factory(:essay, {published: false})
    visit essays_path
    page.should have_css("article.unpublished")
  end
  
  context "while editing" do
    it "can edit" do
      essay = Factory(:essay)
      visit essay_path(essay)
      click_link "Edit"
      new_body = "#hello\nthis is the new ingress"
      fill_in "Body", with: new_body
      click_button "Update"
      essay.reload
      essay.body.should == new_body
    end
    
    it "gets redirected to correct path" do
      essay = Factory(:essay)
      visit essay_path(essay)
      click_link "Edit"
      new_body = "#hello\nthis is the new ingress"
      fill_in "Body", with: new_body
      click_button "Update"
      essay.reload
      current_path.should == essay_path(essay)
    end
  end
end