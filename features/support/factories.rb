require 'factory_girl'

FactoryGirl.define do

  factory :user do
    title			"mgr"
    name			"Jan"
    surname			"Kowalski"
    email			"kob2222@gmail.com"
    password			"apka123"
    password_confirmation	"apka123"	
  end

  factory :subject do
    subject "Science"
  end

end
