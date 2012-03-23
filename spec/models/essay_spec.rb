require 'spec_helper'

describe Essay do
  let(:essay) { Factory.build(:essay) }
  
  it "should extract title from body" do
    title = "title"
    essay.body = "# #{title}"
    essay.title.should == title
  end
  
  it "should return false title if its missing from body" do
    essay.body = "hej hej"
    essay.title.should be_false
  end
  
  it "should return correct html content" do
    essay.body = "#title\nbody"
    essay.to_html.gsub("\n","").should == "<h1>title</h1><p>body</p>"
  end
  
  it "should extract ingress from body" do
    ingress = "This is the ingress"
    essay.body = "# title\n#{ingress}\n\nThis is some other text"
    essay.ingress.should == ingress
  end
  
  context "and slug" do
    it "should generate slug before validation" do
      essay.save
      essay.slug.should == essay.title.parameterize
    end
  
    it "should have slug aliased as to_param" do
      essay.save
      essay.to_param.should == essay.slug
    end
  end
  
  context "validation" do
    it "should fail without body" do
      essay.body = nil
      essay.should_not be_valid
    end
    
    it "should fail without title in body" do
      essay.body = "this is a body without a title"
      essay.should_not be_valid
    end
    
    it "should fail without an ingress" do
      essay.body = "# this is only a title"
      essay.should_not be_valid
    end
    
    it "should fail if slug isnt unique" do
      essay_dup = essay.dup
      essay.save
      essay_dup.should_not be_valid
    end
    
  end
  
end
