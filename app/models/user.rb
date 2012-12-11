class User < ActiveRecord::Base

  has_secure_password

  attr_accessible :email, :name, :surname, :title, :password, :password_confirmation

  validates_uniqueness_of :email
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
validates_presence_of :title
validates_presence_of :name
validates_presence_of :surname
validates_presence_of :email
validates_length_of :title, :minimum => 3, :maximum => 50
validates_length_of :name, :minimum => 3, :maximum => 50
validates_length_of :surname, :minimum => 3, :maximum => 50
validates_length_of :email, :maximum => 50
validates_length_of :password, :minimum => 5, :maximum => 20
end
