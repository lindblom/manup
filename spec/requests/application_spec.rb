require "spec_helper.rb"

describe "Application" do
  it "should redirect to correct domain" do
    path = "/"
    ENV['DOMAIN'] = domain = "example.com"
    get path
    ENV['DOMAIN'] = nil
    response.should redirect_to("http://#{domain}#{path}")
  end
end