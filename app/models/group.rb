class Group < ActiveRecord::Base
  attr_accessible :day, :group, :time, :week
belongs_to :subject

  validates :group, presence: true
  validates :day, presence: true
  validates :week, presence: true
  validates :time, presence: true


end
