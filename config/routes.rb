Mag::Application.routes.draw do

  ActiveAdmin.routes(self)

  root :to => "static_pages#home"

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'groups', to: 'groups#index_all', as: 'groups'
  get 'students', to: 'students#index_all', as: 'students'

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :notes, only: [:new, :create, :edit, :update, :destroy]
  resources :marks, only: [:new, :create, :edit, :update, :destroy, :index]
  resources :subjects, shallow: true do
    resources :groups
  end

  resources :groups, shallow: true do
    resources :students
    resources :lab_classes
    match '/presences/' => "presences#group_presence", via: 'GET'
    match '/give_marks' => "fmarks#give_mark", via: 'GET'
    match '/final_marks' => "fmarks#index", via: 'GET'
    match '/update_marks' => "fmarks#update_mark", via: 'POST'
  end

  resources :lab_classes do
    resources :presences, only: [:index]
    match '/presences/check_presence' => "presences#check_presence", via: 'GET'
    match '/presences/update_presence' => "presences#update_presence", via: 'POST'

  end

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
  # match ':controller(/:action(/:id))(.:format)'
end
