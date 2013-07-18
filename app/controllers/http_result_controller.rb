class HttpResultController < ApplicationController
  def show
          if params[:id]
                  @step = HttpAutomation.find(params[:id])
          end
          @http_results = HttpResult.all
  end
  
  def clear_all
          HttpResult.delete_all
          redirect_to "/http_result/show"
  end
  
  def run_http
          if params[:remote_machine] != nil
                        machine = RemoteMachine.find(params[:remote_machine])
                        envi = params[:cur_env]
                    
                        system(" staf  #{machine.ipaddress} var set shared var envi='#{envi}' > #{machine.ipaddress}.envi.log")
                        system("staf #{machine.ipaddress} process start command ruby #{machine.smokescriptpath}/run.rb > #{machine.ipaddress}.smoke.log")

                        redirect_to  '/http_result/show'
          else
                  redirect_to '/http_result/show', notice: 'No machine is selected! Go and check the remote machine situation!'
          end
  end
  
  def show_ajax_result
          @http_results = HttpResult.order("id DESC").all
          respond_to do |format|
                  format.js
          end
  end
  
end
