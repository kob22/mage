class Fmark < ActiveRecord::Base
  attr_accessible :mark, :note, :student_id
  belongs_to :student

  def self.create_mark(group_id)
    @group = Group.find(group_id)
    @students = @group.students.all


    self.transaction do
      @students.each do |student|
        unless Fmark.find_by_student_id(student.id)
          @fmark = Fmark.new(student_id: student.id)
          @fmark.save
        end
      end
    end
  end


end
