class TcDetailStepsController < ApplicationController
  # GET /tc_detail_steps
  # GET /tc_detail_steps.json
  def index
    @tc_detail_steps = TcDetailStep.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tc_detail_steps }
    end
  end

  # GET /tc_detail_steps/1
  # GET /tc_detail_steps/1.json
  def show
    @tc_detail_step = TcDetailStep.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tc_detail_step }
    end
  end

  # GET /tc_detail_steps/new
  # GET /tc_detail_steps/new.json
  def new
    @tc_detail_step = TcDetailStep.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tc_detail_step }
    end
  end

  # GET /tc_detail_steps/1/edit
  def edit
    @tc_detail_step = TcDetailStep.find(params[:id])
  end

  # POST /tc_detail_steps
  # POST /tc_detail_steps.json
  def create
    @tc_detail_step = TcDetailStep.new(params[:tc_detail_step])

    respond_to do |format|
      if @tc_detail_step.save
        format.html { redirect_to @tc_detail_step, notice: 'Tc detail step was successfully created.' }
        format.json { render json: @tc_detail_step, status: :created, location: @tc_detail_step }
      else
        format.html { render action: "new" }
        format.json { render json: @tc_detail_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tc_detail_steps/1
  # PUT /tc_detail_steps/1.json
  def update
    @tc_detail_step = TcDetailStep.find(params[:id])

    respond_to do |format|
      if @tc_detail_step.update_attributes(params[:tc_detail_step])
        format.html { redirect_to @tc_detail_step, notice: 'Tc detail step was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tc_detail_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tc_detail_steps/1
  # DELETE /tc_detail_steps/1.json
  def destroy
    @tc_detail_step = TcDetailStep.find(params[:id])
    @tc_detail_step.destroy

    respond_to do |format|
      format.html { redirect_to tc_detail_steps_url }
      format.json { head :no_content }
    end
  end
end
