class HttpAutomationsController < ApplicationController
  # GET /http_automations
  # GET /http_automations.json
  def index
    @http_automations = HttpAutomation.page(params[:page]).per(30)
    @hosts = Host.all
              @remote_machines = RemoteMachine.where(["comstatus = ?",0])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @http_automations }
    end
  end

  # GET /http_automations/1
  # GET /http_automations/1.json
  def show
    @http_automation = HttpAutomation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @http_automation }
    end
  end

  # GET /http_automations/new
  # GET /http_automations/new.json
  def new
    @http_automation = HttpAutomation.new

    respond_to do |format|
            if @http_automation.save
      format.html {redirect_to http_automations_url}# new.html.erb
      format.json { render json: @http_automation }
      end
    end
  end

  # GET /http_automations/1/edit
  def edit
    @http_automation = HttpAutomation.find(params[:id])
  end

  # POST /http_automations
  # POST /http_automations.json
  def create
    @http_automation = HttpAutomation.new(params[:http_automation])

    respond_to do |format|
      if @http_automation.save
        format.html { redirect_to @http_automation, notice: 'Http automation was successfully created.' }
        format.json { render json: @http_automation, status: :created, location: @http_automation }
      else
        format.html { render action: "new" }
        format.json { render json: @http_automation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /http_automations/1
  # PUT /http_automations/1.json
  def update
    @http_automation = HttpAutomation.find(params[:id])

    respond_to do |format|
      if @http_automation.update_attributes(params[:http_automation])
        format.html { redirect_to @http_automation, notice: 'Http automation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @http_automation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /http_automations/1
  # DELETE /http_automations/1.json
  def destroy
    @http_automation = HttpAutomation.find(params[:id])
    @http_automation.destroy

    respond_to do |format|
      format.html { redirect_to http_automations_url }
      format.json { head :no_content }
    end
  end
end
