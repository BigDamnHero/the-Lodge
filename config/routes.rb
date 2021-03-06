TheLodge::Application.routes.draw do

  resources :campaigns

  resources :users, :user_sessions, :characters, :races, :character_classes

  root :to => "home#index"
  # get "home/index"
  
  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout
  match 'misc' => 'home#misc', :as => :misc

  match 'register(/:invite_code)' => 'users#register', :as => :register, :via => 'get'
  match 'register(/:invite_code)/' => 'users#submit_registration', :as => :register, :via => [:post, :put]
  match 'activate(/:activation_code)' => 'users#activate', :as => :activate_account
  match 'send_activation(/:user_id)' => 'users#send_activation', :as => :send_activation
  match 'getting_started' => 'general#getting_started', :as => :getting_started
  match 'races/starting_with/:text' => 'races#starting_with'
  match 'campaigns/:id/invite' => 'campaigns#invite', :via => 'get'
  match 'campaigns/:id/invite' => 'campaigns#send_invite', :via => 'post', :as => :campaign_invite

  # Cover Flow helper methods
  match 'cover_flow/races' => 'cover_flow#races'
  match 'cover_flow/race/:race_id' => 'cover_flow#race'
  match 'cover_flow/classes' => 'cover_flow#char_classes'
  match 'cover_flow/class/:id' => 'cover_flow#char_class'

  # Image service
  match 'image/:type/:id(/:gender)' => 'images#image', :as => :image_url
  match 'thumb/:type/:id(/:gender)' => 'images#thumb', :as => :thumb_url

  # Characters


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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
