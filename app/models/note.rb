class Note < ActiveRecord::Base
  attr_accessible :date, :lab_class_id, :note, :student_id

  belongs_to :lab_class
  belongs_to :student

  validates :date, presence: true
  validates :lab_class_id, presence: true
  validates :note, presence: true
  validates :student_id, presence: true

  def owner
    return self.student.group.subject.user_id
  end

end
