namespace :notification do
  desc "Sends mail notification to managers (admin users) each day to inform of pending overtime requests"
  task manager_email: :environment do
    # 1 iterate overtime pending request
    # 2 check to see if there are any requests
    # 3 iterate over the list of admin users/manager
    # 4 send email to each admin
    submitted_posts = Post.submitted
    admin_users = AdminUser.all
    if submitted_posts.count > 0
      admin_users.each do |admin|
        ManagerMailer.email(admin).deliver_later
      end
    end
  end
  
end
