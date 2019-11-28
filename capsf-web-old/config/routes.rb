CapsfWeb::Application.routes.draw do
  
  resources :events

  match "/pages/:slug/posts/:id/edit" => "posts#edit", :as => :edit_post
  
  resources :pages do
    resources :posts
  end

  devise_for :users, :controllers => {:registrations => "registrations", :sessions => 'sessions' }

  root :to => "static#home"

  resources :entries
  
  match "admin/userlist"          => "admin#index",           :via => :get
  match "admin/profile/:id"       => "admin#show",            :via => :get, :as => :profile
  match "admin/edit/:id"          => "admin#edit",            :via => :get, :as => :admin_edit_user
  match "admin/update/:id"        => "admin#update",          :via => :put, :as => :admin_update_user
  match "admin/destroy/:id"       => "admin#destroy",         :via => :delete, :as => :admin_destroy_user
  match "/admin"                  => "admin#links",           :via => :get, :as => :admin_links

  match '/privacy'		  =>'static#privacy',         :as => :privacy
  match '/disclosure'		  =>'static#disclosure',      :as => :disclosure
  match '/info'			  =>'static#info',            :as => :info
  match '/employment'             =>'static#employment',      :as => :employment
  match '/thankyou'               =>'static#thankyou',        :as => :thankyou
  match 'contact'                 =>'contact#new',            :as => :contact, :via => :get
  match 'contact'                 =>'contact#create',         :as => :contact, :via => :post

  match '/search'                 =>'entries#search',         :as => :search
  match '/advanced-search'        =>'entries#advanced_search',   :as => :advanced_search



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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
