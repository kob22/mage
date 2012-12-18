class StudentsController < ApplicationController

  def index
   if params[:group_id]==nil
   @students = Student.all
   else
    @group = Group.find(params[:group_id])
    @students = @group.students.all
   end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @students }
    end
  end


  def show
    @student = Student.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student }
    end
  end

  def new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @student }
    end
  end


  def edit
    @student = Student.find(params[:id])
  end


  def create
    @group = Group.find(params[:group_id])
    if n = @group.students.create_from_text(params[:list_of_student])

     respond_to do |format|
       format.html { redirect_to group_students_path(params[:group_id]), notice: "Added #{n} students" }
       format.json { render json: group_students_path(params[:group_id]), status: :created, location: group_students_path(params[:group_id]) }
     end

    else
    	render :new
    end
  end

  def update
    @student = Student.find(params[:id])

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
    @student = Student.find(params[:id])
    @student.destroy

    respond_to do |format|
      format.html { redirect_to group_students_path(@student.group_id), notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

end
