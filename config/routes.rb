ActionController::Routing::Routes.draw do |map|
  
  #for debugging until I can override the default new
  
  map.bucks_count '/bucks_count', :controller=>'bucks', :action=>'count'
  
  map.resources :time_offs

  map.resources :bucks
  
  map.bulk_destroy_availabilities '/availabilities/bulk_destroy', :controller=>'availabilities', :action=>'bulk_destroy', :conditions => { :method => :delete }
  map.list_training_dates '/trainings/list_by_date', :controller=>'trainings', :action=>'list_by_date'
  map.report_availability '/availabilities/report_by_date', :controller=>'availabilities', :action=>'report_by_date'
  map.list_training '/trainings/list', :controller=>'trainings', :action=>'list'
  map.options '/options', :controller=>'options', :action=>'index'
    
  map.resources :employees

  map.resources :managers

  map.resources :trainings
  
  map.resources :availabilities, :except=>[:edit,:destroy]
  
  
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  map.connect "logged_exceptions/:action/:id", :controller => "logged_exceptions"

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => "application", :action=>'frontpage'

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
