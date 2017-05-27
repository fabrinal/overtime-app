 @user = User.create(
        email: 'test@hobedio.com', 
        password: 'testing1234', 
        password_confirmation: 'testing1234', 
        first_name: 'fabz', 
        last_name: 'rinaldi')

puts "add 1 user"
AdminUser.create(
        email: 'admin@hobedio.com', 
        password: 'testing1234', 
        password_confirmation: 'testing1234', 
        first_name: 'Admin', 
        last_name: 'rinaldi')

100.times do |post|
  Post.create(date: Date.today, rationale: "#{post} rationale", user_id: @user.id, overtime_request: 2.5)
end

puts "create 100 sample"