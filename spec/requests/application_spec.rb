require "spec_helper.rb"

describe "Application" do
  it "should redirect to correct domain" do
    ENV['DOMAIN'] = "example.com"
    get "/"
    response.should redirect_to(ENV['DOMAIN'])
    ENV['DOMAIN'] = nil
  end
end