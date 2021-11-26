Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :urls, except: [:edit]

  get '/u/:short_url', to: "urls#redirect"
end
