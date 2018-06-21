Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
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
 
  get '/politics', to: 'posts#politics'
  get '/entertainment', to: 'posts#entertainment'
  
  get '/sports', to: 'posts#sport'
  get '/product', to: 'posts#product'
  get '/other', to: 'posts#other'

  get '/myposts', to: 'posts#myposts'
  
end
