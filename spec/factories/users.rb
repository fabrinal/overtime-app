FactoryGirl.define do 
  factory :user do
    email 'abc@example.com'
    password 'abcdef' 
    password_confirmation 'abcdef'
    first_name 'fabz' 
    last_name 'rinaldi'
  end
  
  factory :admin_user, class: "AdminUser" do
    email 'admin@example.com'
    password 'abcdef' 
    password_confirmation 'abcdef'
    first_name 'Admin' 
    last_name 'Admin'
  end
end
