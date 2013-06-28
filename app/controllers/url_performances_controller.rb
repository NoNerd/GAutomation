class UrlPerformancesController < ApplicationController
  # GET /url_performances
  # GET /url_performances.json
  def index
    @url_performances = UrlPerformance.all
     @remote_machines = RemoteMachine.where(["comstatus = ?", 0])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @url_performances }
    end
  end

  # GET /url_performances/1
  # GET /url_performances/1.json
  def show
    @url_performance = UrlPerformance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @url_performance }
    end
  end

  # GET /url_performances/new
  # GET /url_performances/new.json
  def new
    @url_performance = UrlPerformance.new
    
    respond_to do |format|
            if @url_performance.save
      format.html {redirect_to url_performances_path}# new.html.erb
      format.json { render json: @url_performance }
        else
                 format.html {redirect_to url_performances_path}
        end
    end
  end

  # GET /url_performances/1/edit
  def edit
    @url_performance = UrlPerformance.find(params[:id])
  end

  # POST /url_performances
  # POST /url_performances.json
  def create
    @url_performance = UrlPerformance.new(params[:url_performance])

    respond_to do |format|
      if @url_performance.save
        format.html { redirect_to @url_performance, notice: 'Url performance was successfully created.' }
        format.json { render json: @url_performance, status: :created, location: @url_performance }
      else
        format.html { render action: "new" }
        format.json { render json: @url_performance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /url_performances/1
  # PUT /url_performances/1.json
  def update
    @url_performance = UrlPerformance.find(params[:id])

    respond_to do |format|
      if @url_performance.update_attributes(params[:url_performance])
        format.html { redirect_to @url_performance, notice: 'Url performance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @url_performance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /url_performances/1
  # DELETE /url_performances/1.json
  def destroy
    @url_performance = UrlPerformance.find(params[:id])
    @url_performance.destroy

    respond_to do |format|
      format.html { redirect_to url_performances_url }
      format.json { head :no_content }
    end
  end
  
  def  run_url_performance
          @machine = RemoteMachine.find(params[:remote_machine])
          system("staf  #{@machine.ipaddress} process start command ruby #{@machine.smokescriptpath}/url_performance.rb")
          redirect_to url_performance_result_path
  end
  
  def url_performance_result
          @results = UrlResult.all
  end
  
  def upr_delete_all
          UrlResult.delete_all
          redirect_to url_performance_result_path
  end
  
  def  ajax_result
          @results =  UrlResult.all
  end
  
end
