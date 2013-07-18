#encoding: utf-8

class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
    @remote_machines = RemoteMachine.where(["comstatus = ?",0])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new
        
    respond_to do |format|
            if @task.save
      format.html {redirect_to tasks_path}# new.html.erb
      format.json { render json: @task }
      else
        format.html {redirect_to tasks_path, notice: '添加失败'}
    end
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end
  
  def get_relative_testcases
          @task = Task.find(params[:task_id])
          @testcases = []
          Tcandtask.where(["task_id = ?",params[:task_id]]).each do |tcatk|
                  @testcases << Testcase.find(tcatk.testcase_id)
          end
  end
  
  
  HTTP_RUNNING_STATUS = 2
  
  def run
          @remote_machine = RemoteMachine.find(params[:remote_machine])
          @testcases = ""
          tcandtks = Tcandtask.where(["task_id = ?",params[:task_id]])
          tcandtks.each_with_index do |tcatk,id|
                  if tcandtks.length-1 == id
                          @testcases = @testcases+"#{tcatk.testcase_id}"
                  else
                          @testcases = @testcases+"#{tcatk.testcase_id},"
                  end
          end
         @task = Task.find(params[:task_id])
         system("staf  #{@remote_machine.ipaddress} var set shared var task_id=#{@task.id}") 
          system("staf #{@remote_machine.ipaddress} var set shared var task_counter=#{@task.run_counter+1}")
          system("staf #{@remote_machine.ipaddress} var set shared var testcases=#{@testcases}")
          system("staf  #{@remote_machine.ipaddress} process start command #{@remote_machine.funcscriptpath}/run.bat ")
        @remote_machine.update_attributes({:comstatus => HTTP_RUNNING_STATUS})

        @task.update_attributes({:run_counter=>@task.run_counter+1})
        redirect_to task_current_result_path(@task,@task.run_counter)
  end
  
  def reset
          @task = Task.find(params[:task_id])
          @task.update_attributes({:run_counter=> 0})
          TestcaseResult.delete_all(["task_id = ?",params[:task_id]])
          StepResult.delete_all(["task_id = ?", params[:task_id]])
          redirect_to tasks_path
  end
  
  def current_result
                @task = Task.find(params[:task_id])
                @testcases_result = TestcaseResult.where(["counter = ? and task_id = ?", params[:counter].to_i, @task.id])
  end
  
  def show_steps
          @task = Task.find(params[:task_id])
          @testcase_result = TestcaseResult.find(params[:testcase_id])
          @testcase = Testcase.find(@testcase_result.testcase_id)
          @steps_result = StepResult.where(["task_id = ? and counter = ? and testcase_id = ?",params[:task_id],params[:counter],@testcase.id])
  end
  
  def show_step_detail
        @step = Teststep.find(params[:step_detail])
  end
  
  def close_step_detail
          @step = params[:step_id]
  end
  
  def show_func_step_result
          @task = Task.find(params[:task_id])
          @testcase_result = TestcaseResult.find(params[:testcase_id])
          @testcase = Testcase.find(@testcase_result.testcase_id)
          @steps_result = StepResult.where(["task_id = ? and counter = ? and testcase_id = ?",params[:task_id],params[:counter],@testcase.id])
          respond_to do |format|
                  format.js
          end
  end
  
  
end
