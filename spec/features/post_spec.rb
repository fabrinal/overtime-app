require 'rails_helper'

  describe 'navigate' do
    before do
      @user = User.create(
        email: 'abc@example.com', 
        password: 'abcdef', 
        password_confirmation: 'abcdef', 
        first_name: 'fabz', 
        last_name: 'rinaldi')
      login_as(@user, :scope => :user)
    end
    describe 'index' do
      before do
        visit posts_path
      end
      
      it 'can be reached successfully' do
        expect(page.status_code).to eq(200)
      end
      it 'has a title of Posts' do
        expect(page).to have_content(/Posts/)
      end

      it 'has a list of posts' do
        post1 = Post.create(date: Date.today, rationale: "Post1", user_id: @user.id)
        post2 = Post.create(date: Date.today, rationale: "Post2", user_id: @user.id)
        visit posts_path
        expect(page).to have_content(/Post1|Post2/)
      end
    end
    describe 'creation' do 
      before do
        visit new_post_path
      end
      
      it 'has a new form that can be reach' do
        expect(page.status_code).to eq(200)
      end

      it 'can be create from new form page' do
        fill_in 'post[date]', with: Date.today
        fill_in 'post[rationale]', with: 'Some Rationale'

        click_on "Save"
        expect(page).to have_content("Some Rationale")
      end

      it 'will have association with current user' do
        fill_in 'post[date]', with: Date.today
        fill_in 'post[rationale]', with: 'User Association'
        click_on "Save"
        
        expect(User.last.posts.last.rationale).to eq("User Association")
      end
    end

  end