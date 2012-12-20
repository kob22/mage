class PresencesController < ApplicationController
  def index
  @lab_class = LabClass.find(params[:lab_class_id])
  @presences = @lab_class.presences.all
  end

  def check_presence
  @lab_class = LabClass.find(params[:lab_class_id])
  @presences = @lab_class.presences.all
  end



  def update_presence

    result = Presence.update(params[:presences].keys, params[:presences].values).reject { |p| p.errors.empty? }
    if result.empty?
      flash[:notice] = "Presence Checked!"
      redirect_to lab_class_path(params[:lab_class_id])
    else 
      flash[:notice] = "Presence Not Checked!"
      redirect_to lab_class_presences_check_presence_path(params[:lab_class_id])
   end

  end

end


