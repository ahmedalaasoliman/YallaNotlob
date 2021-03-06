Rails.application.routes.draw do

  get 'notifications/index'

  get 'users/index'

  resources :items
  resources :orders
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  get 'friends' => 'users#index', as: 'friends'





 
  

  #devise_for  :users 
    resources :friends
    resources :groups
    resources :gusers
    resources :orderusers
    #resources :notifications

  resources :notifications do
    collection do
      post :mark_as_read
    end
  end

    #root 'users#index'

  #get 'friends' => 'users#index', as: 'friends'


  post 'ajax_response' => 'users#ajax_response', as: 'ajax'
  post 'ajax_response_remove' => 'users#ajax_response_remove'
  post 'getUserData' => 'users#getUserData'
  get 'searchuser' => 'users#searchuser'
  get 'deleteguser' => 'gusers#delall'
  get 'finishorder' => 'orders#finish'
  post 'order_ajax' => 'orders#order_ajax_response', as: 'order_ajax'
  post 'order_ajax_remove' => 'orders#order_ajax_response_remove', as: 'order_ajax_remove'

  #resources :items
  #resources :orders
  #root 'orders#index'
  root 'home#index'
  resources :home
 
  
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
