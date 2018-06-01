Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts do
  	resources :comments
    resources :reports
  end



  root 'posts#index'

  get '/about', to: 'pages#about'

  get '/tech', to: 'posts#tech'
  get '/programming', to: 'posts#programming'
  get '/culture', to: 'posts#culture'
  get '/education', to: 'posts#education'
  get '/politics', to: 'posts#politics'
  get '/entertainment', to: 'posts#entertainment'
  get '/personalityDevelopment', to: 'posts#pd'
  get '/sports', to: 'posts#sport'
  get '/product', to: 'posts#product'
  get '/other', to: 'posts#other'

  
  
end
