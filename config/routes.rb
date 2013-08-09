GAutomation::Application.routes.draw do

  resources :tc_detail_steps


  resources :wp_dyna_configs


  resources :url_performances 
  
  post "run_url_performance" => "url_performances#run_url_performance", :as=>"url_perform_run"

  get "url_performance_result" => "url_performances#url_performance_result", :as=>"url_performance_result"

  get "result/show_task"
  
  get "result/show_task_result/:task_id"=>"result#show_task_result", :as=>"show_task_result"
  
  get "result/show_tc_result/:testcase_id" => "result#show_tc_result", :as=>"show_tc_result"

  get "upr_delete_all"=>"url_performances#upr_delete_all", :as=>"upr_delete_all"

  get "ajax_result" => "url_performances#ajax_result", :as=>"ajax_result"

  match "search_result_by_counter" => "result#search_result_by_counter", :as=>"search_result_by_counter"

  match "url_showslow_result" => "url_performances#url_showslow_result", :as=>"url_showslow_result"
  
  match "show_wp_run_situ_result" => "result#show_wp_run_situ_result" , :as=>"show_wp_run_situ_result"
  
 match "multi_handle_steps" => "testcases#multi_handle_steps", :as=>"multi_handle_steps"
  
  match "get_refer_objs" => "tobjects#get_refer_objs", :as=>"get_refer_objs"

  resources :teststeps

  resources :tobjects

   resources :wp_dyna_configs

  resources :testcases do
        get 'check_testcase_and_task' , :action=>"check_testcase_and_task"
        get 'update_testcase_tasks', :action=>"update_testcase_tasks", :as=>"update_tt"
        post 'add_relative_tasks',:action=>"add_relative_tasks",:as=>"add_relative_tasks"
        get 'show_steps',:action=>"show_steps",:as=>"show_steps"
        match 'delete_step/:step_id', :action=>"delete_step", :as=>"delete_step"
        match 'destroy_detail_step/:detail_step_id', :action=>"destroy_detail_step", :as=>"destroy_detail_step"
        match 'add_detail_step', :action=>"add_detail_step",:as=>"add_detail_step"
        match "multi_handle_steps" => "testcases#multi_handle_steps", :as=>"multi_handle_steps"
        match  "insert_step/:teststep_id"=> "testcases#insert_step", :as=>"insert_step"
        collection {post :import}
  end

   match 'tasks/:task_id/cancel_related_tc/:testcase_id' => "tasks#cancel_related_tc", :as=> "cancel_related_tc"     
   match 'tasks/:task_id/change_running_status/:testcase_id' => "tasks#change_running_status", :as=> "change_running_status"     
   match "tasks/:task_id/delete_result/:counter/:testcase_id/steps" =>"tasks#delete_steps", :as=>"delete_steps"

  resources :tasks do
          get 'get_relative_testcases', :action=>"get_relative_testcases",:as=>"get_relative_testcases"
          match 'run', :action=>"run",:as=>"run"
          match 'reset', :action=>"reset",:as=>"reset"
          match 'current_result/:counter', :action=>"current_result",:as=>"current_result" 
          match 'current_result/:counter/:testcase_id/steps', :action=>"show_steps", :as=>"show_current_steps"
  end

   match "show_step_detail/:step_detail"=>"tasks#show_step_detail", :as=>"show_step_detail"
   
   match "close_step_detail/:step_id" => "tasks#close_step_detail", :as=>"close_step_detail"
   
   match "show_ajax_result" => "http_result#show_ajax_result", :as=>"show_ajax_result"

   match "search_http" => "http_automations#search_http", :as=>"search_http"
   
   match "url_showslow_period_result" => "result#url_showslow_period_result", :as=>"url_showslow_period_result"

  get "introduction/usinghttp"

  get "introduction/usingfunc"
  
  get "introduction/installation" => "introduction#installation", :as=>"introduction_installation"

  get "http_result/show(/:id)" => "http_result#show"
  
  get "http_result/delete_all" => "http_result#clear_all"
  
  match "http_result/run_http" => "http_result#run_http"
  
  match "show_func_step_result" => "tasks#show_func_step_result", :as=>"show_func_step_result"

  resources :http_automations

  resources :hosts

  resources :remote_machines  do
          get "check",  :action =>"check_machine_situ"
  end

  wiki_root '/wiki'

  get "equip/uploadify"

  get "user_behave/login"

  get "user_behave/logout"

  get "index/index"

  get "index/introduction"
  
  match "search_by_date"=>"url_performances#search_by_date", :as=>"search_by_date"
  
  match "search_by_range_time"=>"url_performances#search_by_range_time", :as=>"search_by_range_time"

  resources :users

 get "user_behave/login" => "user_behave#login", :as=>"login"
 
 post "user_behave/login" => "user_behave#try_login", :as=>"login"
 
 get "user_behave/logout" => "user_behave#logout", :as => "logout"
 
 get "equip/show" => "equip#show"

 match "stop_machine_running_situ/:remote_machine_id" => "remote_machines#stop_machine_running_situ", :as=>"stop_machine_running_situ"


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'index#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
