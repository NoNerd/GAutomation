#encoding: utf-8

class RemoteMachinesController < ApplicationController
  # GET /remote_machines
  # GET /remote_machines.json
  def index
    @remote_machines = RemoteMachine.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @remote_machines }
    end
  end

  # GET /remote_machines/1
  # GET /remote_machines/1.json
  def show
    @remote_machine = RemoteMachine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @remote_machine }
    end
  end

  # GET /remote_machines/new
  # GET /remote_machines/new.json
  def new
    @remote_machine = RemoteMachine.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @remote_machine }
    end
  end

  # GET /remote_machines/1/edit
  def edit
    @remote_machine = RemoteMachine.find(params[:id])
  end

  # POST /remote_machines
  # POST /remote_machines.json
  def create
    @remote_machine = RemoteMachine.new(params[:remote_machine])

    respond_to do |format|
      if @remote_machine.save
        format.html { redirect_to remote_machines_path, notice: 'Remote machine was successfully created.' }
        format.json { render json: @remote_machines, status: :created, location: @remote_machine }
      else
        format.html { render action: "new" }
        format.json { render json: @remote_machine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /remote_machines/1
  # PUT /remote_machines/1.json
  def update
    @remote_machine = RemoteMachine.find(params[:id])

    respond_to do |format|
      if @remote_machine.update_attributes(params[:remote_machine])
        format.html { redirect_to @remote_machine, notice: 'Remote machine was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @remote_machine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /remote_machines/1
  # DELETE /remote_machines/1.json
  def destroy
    @remote_machine = RemoteMachine.find(params[:id])
    @remote_machine.destroy

    respond_to do |format|
      format.html { redirect_to remote_machines_url }
      format.json { head :no_content }
    end
  end
  
  STATUS_WRONG = 5
  STATUS_ONLINE = 0
  STATUS_OFFLINE = 3
  STATUS_UNKNOWN = 4
  
  def check_machine_situ
          @remote_machine = RemoteMachine.find(params[:remote_machine_id])
          system("STAF #{@remote_machine.ipaddress} Ping Ping > #{@remote_machine.ipaddress}.log")
          File.exist?("#{@remote_machine.ipaddress}.log") ? nil : @remote_machine.comstatus = STATUS_WRONG 
          if  @remote_machine.ipaddress != STATUS_WRONG
                  ss = ""
                File.open("#{@remote_machine.ipaddress}.log","r"){|f| ss = f.readlines.last.dump}
                if ss.include?("PONG")
                        @remote_machine.comstatus  = STATUS_ONLINE
                else
                        @remote_machine.comstatus  = STATUS_OFFLINE
                end
          end 
          
          if @remote_machine.update_attributes({:comstatus => @remote_machine.comstatus})
                 redirect_to remote_machines_path
         else
                redirect_to remote_machine_path, notice: '不能执行更新操作，请检查相关文件信息！'
         end      
  end
  
  
  def  stop_machine_running_situ
          @remote_machine = RemoteMachine.find(params[:remote_machine_id])
          system("STAF #{@remote_machine.ipaddress} process start command #{@remote_machine.funcscriptpath}/kill.bat")
          @remote_machine.update_attributes({:comstatus => STATUS_UNKNOWN})
          redirect_to remote_machines_path
  end
  
  
  
  
end
