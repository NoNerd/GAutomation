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
          if params['md'].to_i == 1
                    system("staf  #{@machine.ipaddress} process start command ruby #{@machine.smokescriptpath}/url_performance_wp.rb")
                    redirect_to url_performance_result_path    
          else
                    system("staf  #{@machine.ipaddress} process start command ruby #{@machine.smokescriptpath}/url_performance_dt.rb")
                    redirect_to   url_showslow_result_path
          end
  end
  
  def url_performance_result
              @results = UrlResult.all
  end
  
  def url_showslow_result
       @url_preformances = UrlPerformance.where(["browser = ?", "ie"])
         @results = Dynatrace.order("id DESC" ).page(params[:page]).per(50).all         
  end
  
  def upr_delete_all
          UrlResult.delete_all
          redirect_to url_performance_result_path
  end
  
  def  ajax_result
          @results =  UrlResult.all
  end
  
  def  search_by_date
          if params[:search_by_day].strip == ""
                  if params[:search_by_address]  == ""
                        @results =   Dynatrace.order("timetoonload DESC, timetofullload DESC" ).page(params[:page]).per(50).all     
                  else
                        @results =   Dynatrace.order("timetoonload DESC, timetofullload DESC").where("details LIKE '%#{params[:search_by_address]}\"%'")
                        if @results.length > 0
                                @wd = WpDynaSummary.new
                                @wd.impression_best = @results.minimum("timetoonload")
                                @wd.impression_worst = @results.maximum("timetoonload")
                        end
                  end
         else
                 time_arr = params[:search_by_day].split("-").map{|a| a.to_i}
                 arr = Time.utc(*time_arr,0,0,0)
                 arr2 = Time.utc(*time_arr, 23,59,59)
               if params[:search_by_address]  == ""      
                      @results = Dynatrace.order("timetoonload DESC, timetofullload DESC").where(timestamp: arr..arr2)
               else
                       @results = Dynatrace.order("timetoonload DESC, timetofullload DESC").where(timestamp: arr..arr2).where("details LIKE '%#{params[:search_by_address]}\"%'")                        
                        
                        if @results.length > 1
                        @wd = WpDynaSummary.new
                        @wd.url = params[:search_by_address]
                        @wd.summary_count = @results.length
                        @wd.onload_best = @results.minimum("timetoonload")
                        @wd.onload_worst = @results.maximum("timetoonload")
                        @wd.onload_average = @results.average("timetoonload")
                        @wd.impression_best = @results.minimum("timetoimpression")
                        @wd.impression_worst = @results.maximum("timetoimpression")
                        @wd.impression_average = @results.average("timetoimpression")
                        @wd.fullload_best = @results.minimum("timetofullload")
                        @wd.fullload_worst = @results.maximum("timetofullload")
                        @wd.fullload_average = @results.average("timetofullload")
                        @wd.render_worst = @results.maximum("timeinrendering")
                        @wd.render_best = @results.minimum("timeinrendering")
                        @wd.render_average = @results.average("timeinrendering")
                        @wd.network_worst = @results.maximum("timeonnetwork")
                        @wd.network_best = @results.minimum("timeonnetwork")
                        @wd.network_average = @results.average("timeonnetwork")
                        @wd = [] << @wd
               end
               end         
          end
  end
  
  
  def search_by_range_time
          if params[:search_by_address].strip == ""
                @results = Dynatrace.order("timetoonload DESC, timetofullload DESC").where(timestamp: params[:start_time]..params[:end_time])
          else
                 @results = Dynatrace.order("timetoonload DESC, timetofullload DESC").where(timestamp: params[:start_time]..params[:end_time]).where("details LIKE '%#{params[:search_by_address]}\"%'")
                if @results.length > 1
                        @wd = WpDynaSummary.new
                        @wd.url = params[:search_by_address]
                        @wd.summary_count = @results.length
                        @wd.onload_best = @results.minimum("timetoonload")
                        @wd.onload_worst = @results.maximum("timetoonload")
                        @wd.onload_average = @results.average("timetoonload")
                        @wd.impression_best = @results.minimum("timetoimpression")
                        @wd.impression_worst = @results.maximum("timetoimpression")
                        @wd.impression_average = @results.average("timetoimpression")
                        @wd.fullload_best = @results.minimum("timetofullload")
                        @wd.fullload_worst = @results.maximum("timetofullload")
                        @wd.fullload_average = @results.average("timetofullload")
                        @wd.render_worst = @results.maximum("timeinrendering")
                        @wd.render_best = @results.minimum("timeinrendering")
                        @wd.render_average = @results.average("timeinrendering")
                        @wd.network_worst = @results.maximum("timeonnetwork")
                        @wd.network_best = @results.minimum("timeonnetwork")
                        @wd.network_average = @results.average("timeonnetwork")
                        @wd = [] << @wd
               end
          end
  end
  
end
