class MarksController < ApplicationController

  def index

    if params[:student_id]==nil || params[:lab_class_id]==nil
      @marks = Mark.all
    else
      @student = Student.find(params[:student_id])
      @lab_class = LabClass.find(params[:lab_class_id])
      @marks=Mark.find_all_by_lab_class_id_and_student_id(@lab_class.id, @student.id)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @groups }
    end
  end


  # GET /marks/new
  # GET /marks/new.json
  def new
    @student = Student.find(params[:student_id])
    @lab_class = LabClass.find(params[:lab_class_id])
    @mark = Mark.new(lab_class_id: @student.id, student_id: @lab_class.id)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mark }
    end
  end

  def create
    @student = Student.find(params[:student_id])
    @lab_class = LabClass.find(params[:lab_class_id])
    @mark = Mark.new(params[:mark])

    respond_to do |format|
      if @mark.save
        format.html { redirect_to @lab_class, notice: 'Mark was successfully created.' }
        format.json { render json: @lab_class, status: :created, location: @lab_class }
      else
        format.html { render action: "new" }
        format.json { render json: @mark.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @mark = Mark.find(params[:id])
  end

  def update
    @mark = Mark.find(params[:id])

    respond_to do |format|
      if @mark.update_attributes(params[:mark])
        format.html { redirect_to marks_path(lab_class_id: @mark.lab_class_id, student_id: @mark.student_id), notice: ' Mark was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mark.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @mark = Mark.find(params[:id])
    @mark.destroy

    respond_to do |format|
      format.html { redirect_to marks_path(lab_class_id: @mark.lab_class_id, student_id: @mark.student_id), notice: 'Mark was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

end
