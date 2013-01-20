class GroupsController < ApplicationController
  # GET /groups
  # GET /groups.json

  def index_all

    @subjects = @current_user.subjects.all
    @groups = Array.new()
    @subjects.each do |subject|
      if @temp =subject.groups.all
        @temp.each do |group|
          @groups << group
        end
      end
    end


    render 'index'
  end

  def index

    @subject = current_background
    @groups = @subject.groups.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @groups }
    end
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @group = current_resource

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @group }
    end
  end

  # GET /groups/new
  # GET /groups/new.json
  def new
    @subject = current_background
    @group = @subject.groups.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @group }
    end
  end

  # GET /groups/1/edit
  def edit
    @group = current_resource
  end

  # POST /groups
  # POST /groups.json
  def create
    @subject = current_background
    @group = @subject.groups.new(params[:group])

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render json: @group, status: :created, location: @group }
      else
        format.html { render action: "new" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /groups/1
  # PUT /groups/1.json
  def update
    @group = current_resource

    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group = current_resource
    @group.destroy

    respond_to do |format|
      format.html { redirect_to subject_groups_path(@group.subject_id), notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private

  def current_resource
    if params[:action].in?(%w[new create])
      @current_resource = current_background
    elsif params[:action].in?(%w[index]) && params[:subject_id]
      @current_resource = current_background
    else
      @current_resource ||= Group.find(params[:id]) if params[:id]
    end

  end

  def current_background
    @current_background ||= Subject.find(params[:subject_id]) if params[:subject_id]
  end

end
