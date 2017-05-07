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
    email { generate :email }
    password 'abcdef' 
    password_confirmation 'abcdef'
    first_name 'Admin' 
    last_name 'Admin'
  end
  factory :non_authorized_user, class: "User" do
    email { generate :email }
    password 'abcdef' 
    password_confirmation 'abcdef'
    first_name 'Yow' 
    last_name 'Dombret'
  end
end
