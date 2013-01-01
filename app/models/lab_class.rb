class LabClass < ActiveRecord::Base
  attr_accessible :date, :note, :subject
  belongs_to :group
  has_many :presences, :dependent => :destroy 
  validates :subject, presence: true
  validates :date, presence: true  
    



end