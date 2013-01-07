class PresencesController < ApplicationController
  before_filter :create_presence, only: :check_presence

  def index
    @lab_class = current_resource
    @presences = @lab_class.presences.all

  end


  def group_presence

    @group = current_background
    @lab_class = @group.lab_classes.all
    @students = @group.students.all
  end


  def check_presence

    @lab_class = current_resource
    @presences = @lab_class.presences.all
  end


  def update_presence
    result= []
    Presence.transaction do
      result = Presence.update(params[:presences].keys, params[:presences].values).reject { |p| p.errors.empty? }
    end
    if result.empty?
      flash[:notice] = "Presence Checked!"
      redirect_to lab_class_path(params[:lab_class_id])
    else
      flash[:notice] = "Presence Not Checked!"
      redirect_to lab_class_presences_check_presence_path(params[:lab_class_id])
    end

  end

  private

  def create_presence
    Presence.create_presence(params[:lab_class_id])
  end

  def current_resource

    if params[:action].in?(%w[group_presence])
      @current_resource = current_background
    else
      @current_resource ||= LabClass.find(params[:lab_class_id]) if params[:lab_class_id]
    end
  end

  def current_background
    @current_background ||= Group.find(params[:group_id]) if params[:group_id]
  end
end


