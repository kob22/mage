class NotesController < ApplicationController

  # GET /notes/new
  # GET /notes/new.json
  def new
    @student = Student.find(params[:student_id])
    @lab_class = LabClass.find(params[:lab_class_id])
    @note = Note.new(lab_class_id: @lab_class.id, student_id: @student.id)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @note }
    end
  end

  def create
    @student = Student.find(params[:student_id])
    @lab_class = LabClass.find(params[:lab_class_id])
    @note = Note.new(params[:note])

    respond_to do |format|
      if @note.save
        format.html { redirect_to @lab_class, notice: 'Note was successfully created.' }
        format.json { render json: @lab_class, status: :created, location: @lab_class }
      else
        format.html { render action: "new" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])

    respond_to do |format|
      if @note.update_attributes(params[:note])
        format.html { redirect_to lab_class_path(@note.lab_class), notice: 'Note was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy

    respond_to do |format|
      format.html { redirect_to lab_class_path(@note.lab_class), notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

end
