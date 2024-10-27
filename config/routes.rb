Rails.application.routes.draw do
  # Option 1 - Allow all controller actions
  resources :artists
  # Option 2 - Allow specific controller actions
  resources :artists, only: [:index, :create, :destroy]
  # Option 3 - Define specific controller action
  get '/artists', to: 'artists#index'

  # if Rails.env.development?
  #   mount GraphiQL::Rails::Engine, at: 'graphiql', graphql_path: 
  #   'graphql#execute'
  #  end
   
  #  post '/graphql', to: 'graphql#execute'

end


# if Rails.env.development?
#   mount GraphiQL::Rails::Engine, at: 'graphiql', graphql_path: 
#   'graphql#execute'
#  end
 
#  post '/graphql', to: 'graphql#execute’