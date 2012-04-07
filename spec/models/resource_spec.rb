require 'spec_helper'

describe Resource do
  let(:podcast) { Factory.build(:podcast) }
  let(:book) { Factory.build(:book) }
  
  context "scopes" do
    before :each do
      podcast.save
      book.save
    end
    
    it "podcasts and only podcasts" do
      Resource.podcasts.count.should eql(1)
      Resource.podcasts.should include podcast
    end
  
    it "books and only books" do
      Resource.books.count.should eql(1)
      Resource.books.should include book
    end
    
    it "the 3 latest" do
      resources = 3.times.map { Factory(:book) }
      Resource.latest.should_not include book
      Resource.latest.should_not include podcast
      resources.each { |resource| Resource.latest.should include resource }
    end
  end
end
