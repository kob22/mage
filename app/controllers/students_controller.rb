class StudentsController < ApplicationController

  def index_all
    @subjects = @current_user.subjects.all
    @students = Array.new()
    @subjects.each do |subject|
      if @temp =subject.groups.all
        @temp.each do |group|
          if @temp2 =group.students.all
            @temp2.each do |student|
              @students << student
            end
          end
        end
      end
    end


    render 'index'
  end

  def index

    @group = current_background
    @students = @group.students.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @students }
    end
  end


  def show
    @student = current_resource

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student }
    end
  end

  def new
    @group = current_background
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @student }
    end
  end


  def edit
    @student = current_resource
  end


  def create
    @group = current_background
    saved, missed = @group.students.create_from_text(params[:list_of_student])
    if saved>0
      if missed == 0
        @notice = "Added #{saved} students"
      else
        @notice = "Added #{saved} students, #{missed} lines were ignored"
      end
      respond_to do |format|
        format.html { redirect_to group_students_path(params[:group_id]), notice: @notice }
        format.json { render json: group_students_path(params[:group_id]), status: :created, location: group_students_path(params[:group_id]) }
      end

    else
      flash[:notice] = 'Did not add students'
      render action: "new"

    end
  end

  def update
    @student = current_resource

    respond_to do |format|
      if @student.update_attributes(params[:student])
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @student = current_resource
    @student.destroy

    respond_to do |format|
      format.html { redirect_to group_students_path(@student.group_id), notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def current_resource

    if params[:action].in?(%w[new create])
      @current_resource = current_background
    elsif params[:action].in?(%w[index]) && params[:group_id]
      @current_resource = current_background
    else
      @current_resource ||= Student.find(params[:id]) if params[:id]
    end
  end

  def current_background
    @current_background ||= Group.find(params[:group_id]) if params[:group_id]
  end

end
