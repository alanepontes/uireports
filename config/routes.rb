Rails.application.routes.draw do

  get 'admin/index'
  get 'page/index'
  get 'page/about'
  get 'page/tutorial'
  get 'profile/index'
  get 'profile/faq'

  resources :activities

  namespace :profile do
    resources :projects do
      resources :telas do
        resources :answers
        get 'relatorio' => 'telas#relatorio', :as => 'relatorio'
      end
      resources :invites
      get 'convidar' => 'projects#invite', :as => 'convidar'
      get 'resultado' => 'projects#resultado'
      get 'avaliar' => 'projects#avaliar', :as => 'avaliar'
    end
    get 'para_avaliar' => 'projects#para_avaliar', :as => 'para_avaliar'
  end

  namespace :admin do
    resources :heuristics do
      resources :questions
    end
  end

  namespace :admin do
    resources :devices
  end

  devise_for :users, :controllers => { :registrations => :registrations }
  resources :ratings, only: :update

  get '/users/:user_id/evaluation/:evaluation_id/feedbacks/new' => 'feedbacks#new', as: :new_feedback
  post '/users/:user_id/evaluation/:evaluation_id/feedbacks' => 'feedbacks#create', as: :feedbacks

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'page#index'

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
