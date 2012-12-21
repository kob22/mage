class LabClassesController < ApplicationController
  # GET /lab_classes
  # GET /lab_classes.json
  def index
   if params[:group_id]==nil
   @lab_classes = LabClass.all
   else
    @group = Group.find(params[:group_id])
    @lab_classes = @group.lab_classes.all
   end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lab_classes }
    end
  end

  # GET /lab_classes/1
  # GET /lab_classes/1.json
  def show
    @lab_class = LabClass.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lab_class }
    end
  end

  # GET /lab_classes/new
  # GET /lab_classes/new.json
  def new

    @group = Group.find(params[:group_id])
    @lab_class = @group.lab_classes.new

  end

  # GET /lab_classes/1/edit
  def edit
    @lab_class = LabClass.find(params[:id])
  end

  # POST /lab_classes
  # POST /lab_classes.json
  def create

    @group = Group.find(params[:group_id])
    @lab_class = @group.lab_classes.new(params[:lab_class])

    respond_to do |format|
      if @lab_class.save


        format.html { redirect_to @lab_class, notice: 'Lab class was successfully created.' }
        format.json { render json: @lab_class, status: :created, location: @lab_class }
      else
        format.html { render action: "new" }
        format.json { render json: @lab_class.errors, status: :unprocessable_entity }
      end
    end

  end

  # PUT /lab_classes/1
  # PUT /lab_classes/1.json
  def update
    @lab_class = LabClass.find(params[:id])

    respond_to do |format|
      if @lab_class.update_attributes(params[:lab_class])
        format.html { redirect_to @lab_class, notice: 'Lab class was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lab_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lab_classes/1
  # DELETE /lab_classes/1.json
  def destroy
    @lab_class = LabClass.find(params[:id])
    @lab_class.destroy

    respond_to do |format|
      format.html { redirect_to lab_classes_url }
      format.json { head :no_content }
    end
  end
end
