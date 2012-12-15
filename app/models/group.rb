class Group < ActiveRecord::Base
  attr_accessible :day, :group, :subject_id, :time, :week
belongs_to :subject

validates_presence_of :group
validates_presence_of :day
validates_presence_of :time
validates_presence_of :week
validates_presence_of :subject_id

end
