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
        
   def search_result_by_counter
           if params['counter'].strip != ""
                @results = TestcaseResult.where(["task_id = ? and counter = ?",params['task'].to_i, params['counter'].to_i])
           else
                 @results = TestcaseResult.where(["task_id = ?",params['task'].to_i]) 
           end   
           @task = Task.find(params['task'].to_i)    
   end     

   def  url_showslow_period_result
           @wp_config = WpDynaConfig.find(1)
           @wp_run_situ = WpRunSitu.all
   end

   def show_wp_run_situ_result
           @wp_config = WpDynaConfig.find(1)
           @wp_dyna_summaries = WpDynaSummary.where(["belong_period = ?", params[:period]])
   end

end
