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


AuditLog.create!(user_id: @user.id, status: 0, start_date: (Date.today - 6.days))
AuditLog.create!(user_id: @user.id, status: 0, start_date: (Date.today - 13.days))
AuditLog.create!(user_id: @user.id, status: 0, start_date: (Date.today - 20.days))

puts "3 audit logs have been created"

100.times do |post|
  Post.create(date: Date.today, rationale: "#{post} rationale content Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt", user_id: @user.id, overtime_request: 2.5)
end

puts "create 100 sample"
