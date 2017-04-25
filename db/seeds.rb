 @user = User.create(
        email: 'test@hobedio.com', 
        password: 'testing1234', 
        password_confirmation: 'testing1234', 
        first_name: 'fabz', 
        last_name: 'rinaldi')

puts "add 1 user"

100.times do |post|
  Post.create(date: Date.today, rationale: "#{post} rationale", user_id: @user.id)
end

puts "create 100 sample"