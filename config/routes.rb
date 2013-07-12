Coffeespec2::Application.routes.draw do

  resources :pages do
    resources :drinks do
      collection do
        get :preview
      end
    end
  end

  match '/auth/:provider/callback', :to => 'session#create', :via => [:get, :post]
  get '/auth/failure', :to => 'session#failure'
  get '/auth/sign_out', :to => 'session#destroy', :as => 'sign_out'
  get '/auth/:provider', :to => 'session#nothing', :as => 'sign_in', :defaults => { :provider => 'developer' }

  root :to => 'application#root'

end
