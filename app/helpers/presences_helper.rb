module PresencesHelper
	
	def status_presences
	  [ '<img class="absent">'.html_safe, '<img class="present">'.html_safe ]
	end


	def status_presence(present)
	 if present
	  status_presences[present.to_i]
         end
	end

end

