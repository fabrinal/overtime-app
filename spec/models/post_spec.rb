require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "creation" do
    before do
      @post = FactoryGirl.create(:post)
      # @post = Post.create(date: Date.today, rationale: 'Anything',user_id: user.id)
    end

    it "can be created" do
      expect(@post).to be_valid
    end

    it "cannot be created without date and rationale" do
      @post.date = nil
      @post.rationale = nil
      @post.overtime_request = nil
      expect(@post).not_to be_valid
    end

    it "must have an overtime request > 0.0" do
      @post.overtime_request = 0.0
      expect(@post).not_to be_valid
    end
    
  end
end
