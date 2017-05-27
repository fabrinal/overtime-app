FactoryGirl.define do 
  factory :post do
    date Date.today
    rationale "Some Rationale"
    user
    overtime_request 2.5
  end
  
  factory :second_post, class: "Post" do
    date Date.yesterday
    rationale "Some about Content"
    user
  end

  factory :post_from_other_user, class: "Post" do
    date Date.yesterday
    rationale "Some about Content"
    non_authorized_user
  end
end

