Rails.application.routes.draw do
  resources :states do
    resources :parks
  end
  get '/random', to: 'parks#random'
end
