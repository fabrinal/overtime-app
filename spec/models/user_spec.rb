require 'rails_helper'

RSpec.describe User, type: :model do
  describe "creation" do
    before do
      @user =  User.create(email: 'abc@example.com', password: 'abcdef', password_confirmation: 'abcdef', first_name: 'fabz', last_name: 'rinaldi')
    end
    it "can be created" do
      expect(@user).to be_valid
    end

    it "must have first name and last name to be valid" do
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).not_to be_valid
    end
  end
end
