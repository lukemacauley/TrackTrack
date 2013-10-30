Tracktrack::Application.routes.draw do

  get '(*any)' => redirect { |p, req| req.url.sub('www.', '') }, constraints: { host: /^www\./ }

  devise_for :users, path: "", path_names: { sign_in: 'login', sign_out: 'signout', confirmation: 'verification', unlock: 'unblock', registration: '', sign_up: 'signup', registrations: '' }
  resources :meals, only: :create

  get 'yesterday' => 'meals#yesterday'

  devise_scope :user do 
    get "settings/profile" => "devise/registrations#profile", as: :profile
    get "settings/account" => "devise/registrations#edit", as: :settings
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

    root 'meals#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

      get "cardio" => "pages#cardio"
      get "cutting" => "pages#cutting"
      get "bulking" => "pages#bulking"
      get "help" => "pages#help"

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

      get 'favourites' => 'meals#favourites'

      get 'add' => 'meals#new', as: :new_meal
      get 'meal-:id/edit' => 'meals#edit', as: :edit_meal
      get 'meal-:id' => 'meals#show', as: :meal
      patch 'meal-:id' => 'meals#update'
      put 'meal-:id' => 'meals#update'
      delete 'meal-:id' => 'meals#destroy'

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
