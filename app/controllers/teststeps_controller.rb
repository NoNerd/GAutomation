class TeststepsController < ApplicationController
  # GET /teststeps
  # GET /teststeps.json
  def index
    @teststeps = Teststep.all

    respond_to do |format|
      format.html   
      format.json { render json: @teststeps }
    end
  end

  # GET /teststeps/1
  # GET /teststeps/1.json
  def show
    @teststep = Teststep.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @teststep }
    end
  end

  # GET /teststeps/new
  # GET /teststeps/new.json
  def new
    @teststep = Teststep.new
    @teststep.testcase_id = params[:testcase_id]    
    respond_to do |format|
            if @teststep.save
      format.html {redirect_to testcase_show_steps_path(params[:testcase_id])} # index.html.erb# new.html.erb
      format.json { render json: @teststep }
      end
    end
  end

  # GET /teststeps/1/edit
  def edit
    @teststep = Teststep.find(params[:id])
  end

  # POST /teststeps
  # POST /teststeps.json
  def create
    @teststep = Teststep.new(params[:teststep])

    respond_to do |format|
      if @teststep.save
        format.html { redirect_to @teststep, notice: 'Teststep was successfully created.' }
        format.json { render json: @teststep, status: :created, location: @teststep }
      else
        format.html { render action: "new" }
        format.json { render json: @teststep.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /teststeps/1
  # PUT /teststeps/1.json
  def update
    @teststep = Teststep.find(params[:id])

    respond_to do |format|
      if @teststep.update_attributes(params[:teststep])
        format.html { redirect_to @teststep, notice: 'Teststep was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @teststep.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teststeps/1
  # DELETE /teststeps/1.json
  def destroy
    @teststep = Teststep.find(params[:id])
    @teststep.destroy

    respond_to do |format|
      format.html { redirect_to teststeps_url }
      format.json { head :no_content }
    end
  end
  
end
