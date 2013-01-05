module PresencesHelper

  def status_presences
    ['<div style="display: none">A</div><img class="absent" alt="absent">'.html_safe, '<div style="display: none">P</div><img class="present" alt="present">'.html_safe]
  end


  def status_presence(present)
    if present
      status_presences[present.to_i]
    end
  end

end

