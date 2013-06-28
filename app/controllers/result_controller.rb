class ResultController < ApplicationController
  
  def show_task
          @tasks = Task.all
          @testcases = Testcase.all
  end

  def show_task_result
          @task = Task.find(params[:task_id])
          # @ss = Task.where(max(:task_id))
          @results = TestcaseResult.where(["task_id = ?", params[:task_id]])
  end

   def show_tc_result
           @step_results = TestcaseResult.where(["testcase_id = ?", params[:testcase_id]])
           @testcase = Testcase.find(params[:testcase_id])
   end

end
