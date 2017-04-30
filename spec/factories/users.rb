FactoryGirl.define do 

  sequence :email do |n|
    "test#{n}@example.com"
  end
  
  factory :user do
    email { generate :email }
    password 'abcdef' 
    password_confirmation 'abcdef'
    first_name 'fabz' 
    last_name 'rinaldi'
  end
  
  factory :admin_user, class: "AdminUser" do
    email email { generate :email }
    password 'abcdef' 
    password_confirmation 'abcdef'
    first_name 'Admin' 
    last_name 'Admin'
  end
end
