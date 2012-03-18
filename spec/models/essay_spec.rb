require 'spec_helper'

describe Essay do
  let(:essay) { Factory(:essay) }
  
  it "does have a category" do
    essay.category.should_not be_nil
  end
  
  it "should not save without a category" do
    essay = Factory.build(:essay, category: nil)
    essay.should_not be_valid
  end
  
  it "should generate slug before validation" do
    new_essay = Factory.build(:essay, slug: nil)
    new_essay.save
    new_essay.slug.should == essay.title.parameterize
  end
end
