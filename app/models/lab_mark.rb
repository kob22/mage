class LabMark < ActiveRecord::Base
  attr_accessible :description, :mark
  belongs_to :presence
end
