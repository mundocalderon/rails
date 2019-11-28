Rails.application.routes.draw do

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  
  get 'admin_home', to: 'static_pages#admin_home', as: :admin_home #url => /static_pages/home
  get 'alt_home', to: 'static_pages#alt_home'
  get 'home', to: 'static_pages#home', as: :home
  get 'joel', to: 'static_pages#joel', as: :joel
  get 'tpc', to: 'static_pages#tpc', as: :tpc
  
  get 'vids', to: 'static_pages#vids', as: :vids #url => /vids
  get 'contact', to: 'static_pages#contact', as: :contact

  resources :videos
  resources :users
  resources :sessions
  resources :tours
  resources :gigs
  resources :announcements

  mount Bootsy::Engine => '/bootsy', as: 'bootsy'


  root 'static_pages#home'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
