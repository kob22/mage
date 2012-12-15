class Subject < ActiveRecord::Base
  attr_accessible :subject
has_many :groups, :dependent => :destroy

validates_presence_of :subject

end
