require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "creation" do
    before do
      user = User.create(email: 'abc@example.com', password: 'abcdef', password_confirmation: 'abcdef', first_name: 'fabz', last_name: 'rinaldi')
      login_as(user, :scope => :user)
      @post = Post.create(date: Date.today, rationale: 'Anything',user_id: user.id)
    end

    it "can be created" do
      expect(@post).to be_valid
    end

    it "cannot be created without date and rationale" do
      @post.date = nil
      @post.rationale = nil
      expect(@post).not_to be_valid
    end
  end
end
