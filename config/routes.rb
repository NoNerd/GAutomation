GAutomation::Application.routes.draw do

  resources :teststeps


  resources :tobjects


  resources :testcases do
        get 'check_testcase_and_task' , :action=>"check_testcase_and_task"
        get 'update_testcase_tasks', :action=>"update_testcase_tasks", :as=>"update_tt"
        post 'add_relative_tasks',:action=>"add_relative_tasks",:as=>"add_relative_tasks"
        get 'show_steps',:action=>"show_steps",:as=>"show_steps"
  end


  resources :tasks do
          get 'get_relative_testcases', :action=>"get_relative_testcases",:as=>"get_relative_testcases"
          match 'run', :action=>"run",:as=>"run"
          match 'reset', :action=>"reset",:as=>"reset"
          match 'current_result/:counter', :action=>"current_result",:as=>"current_result"
  end


  get "introduction/usinghttp"

  get "introduction/usingfunc"

  get "http_result/show(/:id)" => "http_result#show"
  
  get "http_result/delete_all" => "http_result#clear_all"
  
  match "http_result/run_http" => "http_result#run_http"

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
  

  resources :users

 get "user_behave/login" => "user_behave#login", :as=>"login"
 
 post "user_behave/login" => "user_behave#try_login", :as=>"login"
 
 get "user_behave/logout" => "user_behave#logout", :as => "logout"
 
 get "equip/show" => "equip#show"


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
