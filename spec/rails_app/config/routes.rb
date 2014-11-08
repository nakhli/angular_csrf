Rails.application.routes.draw do
  get '/', to: 'guinea_pig#index'
  post '/', to: 'guinea_pig#create'
  post '/create_and_reset_session', to: 'guinea_pig#create_and_reset_session'
end
