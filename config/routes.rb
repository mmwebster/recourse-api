Rails.application.routes.draw do
  # devise_for :users
  # devise_for :users, path: "auth", path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  devise_for :users, controllers: { sessions: 'sessions' } #, registration: 'registrations' }
  devise_for :students, controllers: { sessions: 'sessions' } #, registration: 'registrations' }
  devise_for :admins, controllers: { sessions: 'sessions' } #, registration: 'registrations' }

  # devise_scope :user do
  #   get "sign_in", to: "devise/sessions#new"
  # end

  # define root (needed for Devise)
  root to: "home#index"

  namespace :api do
    namespace :v1, :defaults => { :format => :json } do
      jsonapi_resources :schools
      jsonapi_resources :users
      jsonapi_resources :students
      jsonapi_resources :admins
      jsonapi_resources :nodes
      jsonapi_resources :courses
      jsonapi_resources :quarters
      jsonapi_resources :timelines
      jsonapi_resources :degree_majors
      jsonapi_resources :degree_minors
      match "timeline/map" => "timelines#map", via: [:get, :post]
      match "timelines/map" => "timelines#map", via: [:get, :post]
    end
  end

  match "/*path" => "home#index", via: [:get]

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
