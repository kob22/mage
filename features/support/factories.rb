require 'factory_girl'

FactoryGirl.define do

  factory :user do
    title "mgr"
    name "Jan"
    surname "Kowalski"
    email "kob2222@gmail.com"
    password "apka123"
    password_confirmation "apka123"
  end

  factory :blank_user, class: User do
    title ""
    name ""
    surname ""
    email ""
    password ""
    password_confirmation ""
  end

  factory :subject do
    subject "Science"
  end

  factory :student do
    group
    name Faker::Name.first_name
    surname Faker::Name.last_name
  end


  factory :group do
    group "First"
    day "Friday"
    week "AB"
    time "17:00"
    subject

  end

  factory :lab_class do
    subject "First lesson"
    date Time.now
    note "Some note about lesson"
    group

  end


end
