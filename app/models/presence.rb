class Presence < ActiveRecord::Base
  attr_accessible :lab_class_id, :note, :presence, :student_id
belongs_to :lab_class
belongs_to :student

  def self.create_presence(lab_class_id)
	 @students = LabClass.find(lab_class_id).group.students.all
	 @presences = LabClass.find(lab_class_id).presences.all


        unless @presences.count == @students.count
		if @presences.count == 0
		    @students.each do |student|
	     		@presence = student.presences.new(lab_class_id: lab_class_id)
	      		@presence.save
	    	    end
  	  	else
		    @students.each do |student|
			unless Presence.find_by_lab_class_id_and_student_id(lab_class_id,student.id)	     		
			@presence = student.presences.new(lab_class_id: lab_class_id)
	      		@presence.save
			end
	    	    end			
			


		
		end
		

	end


  end

end
