class FmarksController < ApplicationController
  before_filter :create_mark, only: :give_mark

  def index
    @group = current_resource
    @students = @group.students.all
    @fmarks = Array.new()
    @students.each do |student|
      if temp =Fmark.find_by_student_id(student.id)
        @fmarks << temp
      end
    end
  end


  def give_mark

    @group = current_resource
    @students = @group.students.all
    @fmarks = Array.new()
    @students.each do |student|
      @fmarks << Fmark.find_by_student_id(student.id)
    end


  end


  def update_mark
    result= []
    result = Fmark.update(params[:fmarks].keys, params[:fmarks].values).reject { |p| p.errors.empty? }

    if result.empty?
      flash[:notice] = "Marks Given"
      redirect_to group_path(params[:group_id])
    else
      flash[:notice] = "Marks Not Given"
      redirect_to group_group_give_mark_path(params[:group_id])
    end

  end

  private

  def create_mark
    Fmark.create_mark(params[:group_id])
  end

  def current_resource

    @current_resource ||= Group.find(params[:group_id]) if params[:group_id]

  end


end


