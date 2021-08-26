require 'rails_helper'

RSpec.describe Post do
  
  it "title for post should be present" do
    post = Post.new(title: nil)
    expect(post).to_not be_valid
  end
  it "body for post should be present" do
    post = Post.new(body: nil)
    expect(post).to_not be_valid
  end
end