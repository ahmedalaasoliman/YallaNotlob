Rails.application.routes.draw do
<<<<<<< HEAD
  get 'users/index'

  resources :items
  resources :orders
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root 'orders#index'

  get 'friends' => 'users#index', as: 'friends'

  post 'ajax_response' => 'users#ajax_response', as: 'ajax'
  post 'ajax_response_remove' => 'users#ajax_response_remove'

=======

 
  get 'users/index'

  #devise_for  :users 
    resources :friends
    resources :orders
    resources :items
    resources :groups
    
    root 'users#index'

  #get 'friends' => 'users#index', as: 'friends'

  post 'ajax_response' => 'users#ajax_response', as: 'ajax'
  post 'ajax_response_remove' => 'users#ajax_response_remove'
  
  #resources :items
  #resources :orders
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  #root 'orders#index'
  #root 'home#index'
 
>>>>>>> 4746a91393ef15a2fae932dbf7dac2abd8d58486
  
    # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
