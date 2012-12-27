class LabMarksController < ApplicationController
  # GET /lab_marks
  # GET /lab_marks.json
  def index
    @lab_marks = LabMark.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lab_marks }
    end
  end

  # GET /lab_marks/1
  # GET /lab_marks/1.json
  def show
    @lab_mark = LabMark.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lab_mark }
    end
  end

  # GET /lab_marks/new
  # GET /lab_marks/new.json
  def new
    @lab_mark = LabMark.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lab_mark }
    end
  end

  # GET /lab_marks/1/edit
  def edit
    @lab_mark = LabMark.find(params[:id])
  end

  # POST /lab_marks
  # POST /lab_marks.json
  def create
    @lab_mark = LabMark.new(params[:lab_mark])

    respond_to do |format|
      if @lab_mark.save
        format.html { redirect_to @lab_mark, notice: 'Lab mark was successfully created.' }
        format.json { render json: @lab_mark, status: :created, location: @lab_mark }
      else
        format.html { render action: "new" }
        format.json { render json: @lab_mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lab_marks/1
  # PUT /lab_marks/1.json
  def update
    @lab_mark = LabMark.find(params[:id])

    respond_to do |format|
      if @lab_mark.update_attributes(params[:lab_mark])
        format.html { redirect_to @lab_mark, notice: 'Lab mark was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lab_mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lab_marks/1
  # DELETE /lab_marks/1.json
  def destroy
    @lab_mark = LabMark.find(params[:id])
    @lab_mark.destroy

    respond_to do |format|
      format.html { redirect_to lab_marks_url }
      format.json { head :no_content }
    end
  end
end
