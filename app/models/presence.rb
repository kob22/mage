class Presence < ActiveRecord::Base
  attr_accessible :lab_class_id, :note, :presence, :student_id
belongs_to :lab_class
belongs_to :student

  def self.create_presence(students,lab_class_id)
     students.each do |student|
      @presence = student.presences.new(lab_class_id: lab_class_id, presence: 0)
      @presence.save
    end
  end

end
