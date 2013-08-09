#encoding:utf-8

class TestcasesController < ApplicationController
  # GET /testcases
  # GET /testcases.json
  def index
    @testcases = Testcase.order(:name).all
    @tasks = Task.all
    @spec_testcase = session[:tc]
      session[:tc] = nil
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @testcases }
    end
  end

  # GET /testcases/1
  # GET /testcases/1.json
  def show
    @testcase = Testcase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @testcase }
    end
  end

  # GET /testcases/new
  # GET /testcases/new.json
  def new
    @testcase = Testcase.new
        
    respond_to do |format|
       if @testcase.save
      format.html {redirect_to testcases_path, notice: '创建成功'}# new.html.erb
      format.json { render json: @testcase }
      else
      format.html {redirect_to testcases_path, notice: '创建失败'}# new.html.erb
      format.json { render json: @testcase }
    end
    end
  end

  # GET /testcases/1/edit
  def edit
    @testcase = Testcase.find(params[:id])
  end

  # POST /testcases
  # POST /testcases.json
  def create
    @testcase = Testcase.new(params[:testcase])

    respond_to do |format|
      if @testcase.save
        format.html { redirect_to @testcase, notice: 'Testcase was successfully created.' }
        format.json { render json: @testcase, status: :created, location: @testcase }
      else
        format.html { render action: "new" }
        format.json { render json: @testcase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /testcases/1
  # PUT /testcases/1.json
  def update
    @testcase = Testcase.find(params[:id])

    respond_to do |format|
      if @testcase.update_attributes(params[:testcase])
        format.html { redirect_to @testcase, notice: 'Testcase was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @testcase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /testcases/1
  # DELETE /testcases/1.json
  def destroy
    @testcase = Testcase.find(params[:id])
    @testcase.destroy

    respond_to do |format|
      format.html { redirect_to testcases_url }
      format.json { head :no_content }
    end
  end
  
  def check_testcase_and_task
        @tc_tasks = Tcandtask.where(["testcase_id = ?",params[:testcase_id]])
        @tcid = params[:testcase_id]
          # format.js
  end
  
  def update_testcase_tasks
          @spec_testcase = Testcase.find(params[:testcase_id])
           session[:tc] = @spec_testcase
          redirect_to testcases_path
  end
  
  def add_relative_tasks
          Tcandtask.delete_all(["testcase_id = ?", params[:testcase_id]])
          tks = params[:task]
          tks.each do |tk|
                 @tcandtk = Tcandtask.new
                 @tcandtk.testcase_id = params[:testcase_id]
                 @tcandtk.task_id = tk
                 @tcandtk.save
          end
          redirect_to testcases_path
  end
  
  def show_steps
          @teststeps = Teststep.order(:step).where(["testcase_id = ?", params[:testcase_id]])
          @testcase = Testcase.find(params[:testcase_id])
          @tc_detail_steps = TcDetailStep.where(["testcase_id = ? ", params[:testcase_id]])
          respond_to do |format|
                  format.html
                  format.xls
          end
  end
  
  def delete_step
          @step = Teststep.find(params[:step_id])
          step_number = @step.step
                    step_number = step_number.nil?  ?   0 : step_number
          @step.destroy
          rs = Teststep.where(["testcase_id = ? and step > ?",@step.testcase_id, step_number])
          if rs
                  rs.each_with_index do |r, id|
                        r.update_attributes(:step=>step_number+id)
                  end       
          end
          redirect_to testcase_show_steps_path(params[:testcase_id])
  end
  
  def  import
          Testcase.import(params[:file],params[:testcase_id])
          redirect_to testcase_show_steps_path(params[:testcase_id])
  end
  
  
  def  destroy_detail_step
          @tc_detail_step = TcDetailStep.find(params[:detail_step_id])
          @tc_detail_step.destroy
          redirect_to  testcase_show_steps_path(params[:testcase_id])
  end
  
  def  add_detail_step
          @tc_detail_step = TcDetailStep.new
          @tc_detail_step.testcase_id = params[:testcase_id]
          @tc_detail_step.save
          redirect_to testcase_show_steps_path(params[:testcase_id])
  end
  
  def  multi_handle_steps
          if params[:delete] 
                  if   !params[:ckbox].nil?
                  Teststep.delete(params[:ckbox])
                  end
                  redirect_to  testcase_show_steps_path(params[:testcase_id])
          elsif  params[:change_yes]
                  rs = Teststep.where(id: params[:ckbox])
                  if rs.length != 0 and !rs.nil?
                          rs.each do |r|
                                r.update_attributes({:run=>0})
                        end
                  end
                  redirect_to   testcase_show_steps_path(params[:testcase_id])
          elsif params[:change_no]
                  tps = Teststep.where(id: params[:ckbox])
                  if tps.length != 0 and !tps.nil?
                          tps.each do |r|
                                r.update_attributes({:run=>1})
                        end 
                  end
                  redirect_to   testcase_show_steps_path(params[:testcase_id])
          end
  end
  
  def  insert_step
          @tsp = Teststep.new
          step_number = Teststep.find(params[:teststep_id]).step
          step_number = step_number.nil?  ?   0 : step_number
          @tsp.testcase_id = params[:testcase_id]
          @tsp.step = step_number + 1
          rs = Teststep.where(["testcase_id = ? and step > ?",params[:testcase_id], step_number])
          if rs
                rs.each_with_index   do |sp,id|
                        break  if  (id == 0 and  sp.step != step_number + 1)
                        sp.update_attributes(:step=>sp.step+1)
                end
          end
          @tsp.save
          redirect_to     testcase_show_steps_path(params[:testcase_id])
  end
  
  
end
