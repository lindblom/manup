require 'spec_helper'

describe Category do
  let (:category) { Factory(:category) }
  
  it "does have essays" do
    category.essays.should == []
  end
  
  it "should list added essays" do
    essay = Factory.build(:essay, category: nil)
    category.essays << essay
    category.essays.should include essay
  end
  
  it "should create a slug by paramterize the title" do
    new_category = Factory.build(:category, slug: nil)
    new_category.save
    new_category.slug.should == new_category.title.parameterize
  end
end
