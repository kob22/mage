class LabClass < ActiveRecord::Base
  attr_accessible :date, :mark, :note, :subject
  belongs_to :group
  has_many :presences 
  validates :subject, presence: true
  validates :date, presence: true  
    



end
