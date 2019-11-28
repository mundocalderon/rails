Experts::Application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations", :sessions => 'sessions',
                                      :passwords => 'passwords', :confirmations => 'confirmations' }

  resources :documents

  resources :contacts

  resources :addresses

  resources :people

  resources :form_steps
  
  resources :comments, :only => [:create, :destroy]
  
  match '/advanced-search'    =>'people#advanced_search', :as => :advanced_search
  match "admin/userlist"          => "admin#index",         :via => :get
  match "admin/profile/:id"       => "admin#show",          :via => :get, :as => :profile
  match "admin/edit/:id"          => "admin#edit",          :via => :get, :as => :admin_edit_user
  match "admin/update/:id"        => "admin#update",        :via => :put, :as => :admin_update_user
  match "admin/destroy/:id"       => "admin#destroy",       :via => :delete, :as => :admin_destroy_user
  
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
  devise_scope :user do
    root :to => 'sessions#new'
  end
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
