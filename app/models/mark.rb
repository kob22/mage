class Mark < ActiveRecord::Base
  attr_accessible :date, :lab_class_id, :mark, :student_id, :note

  belongs_to :lab_class
  belongs_to :student

  validates :date, presence: true
  validates :lab_class_id, presence: true
  validates :student_id, presence: true
  validates :mark, presence: true

end
