Coffeespec2::Application.routes.draw do

  resources :posters do
    resources :drinks do
      collection do
        get :preview
      end
    end
  end

  match '/auth/:provider/callback', :to => 'session#create', :via => [:get, :post]
  get '/auth/failure', :to => 'session#failure'
  get '/auth/sign_out', :to => 'session#destroy', :as => 'sign_out'
  get '/auth/:provider', :to => 'session#nothing', :as => 'sign_in', :defaults => { :provider => 'facebook' }

  get 'about' => 'application#about'
  root :to => 'application#about'


  get '404', :to => 'static#not_found'
  get '401', :to => 'static#not_found'
  get '403', :to => 'static#no_permission'
  get '422', :to => 'static#internal_error'
  get '500', :to => 'static#internal_error'

end
