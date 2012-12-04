MyBlog::Application.routes.draw do
  resources :sessions, only: [:create,:destroy,:new]
  resource :contacts, only: [:create]
  resources :posts do
    resources :comments, only: [:create,:destroy]    
    #collection do
     # get "/:title", to: "posts#show"
    #end    
  end

  # ROOT:
  root to: "posts#index"

  # Sessions
  delete '/salir', to: 'sessions#destroy'
  match 'entrar', to: "sessions#new"

  # User
  match '/mensajes', to: "users#mensajes"
  # Comments
  put '/leido/:id', to: 'comments#leido', as: "comment_leido"
  #Post
  get '/:title', to: "posts#show", as: 'post_title'

  
  # Comments
  #post '/:title/:coment', to: "comments#create"
  #delete '/:title/:comment', to: "comments#destroy"
  #match '/post/:title', to: 'posts#show', via: :get, as: "post"
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
