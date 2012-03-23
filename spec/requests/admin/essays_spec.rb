require "spec_helper"

describe "Essays(as admin)" do
  let(:essay) { Factory(:essay) }
  it "can be created" do
    visit new_admin_essay_path
    fill_in "Body", with: "# Title\nThis is the body"
    click_button "Add"
    Essay.count.should eql(1)
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