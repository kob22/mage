class Marks < ActiveRecord::Base
  attr_accessible :date, :lab_class_id, :mark, :student_id
end
