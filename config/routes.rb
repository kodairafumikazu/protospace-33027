Rails.application.routes.draw do
  devise_for :users  #:prototypes  :comments
  get 'prototypes/index'
  #post 'posts', to: 'posts#create'
  #user 'users/:id', to: 'users#checked'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "prototypes#index"
  resources :prototypes do
    resources :comments, only: :create
  end
  resources :users, only: :show
  #, only: [:index, :new, :create, :destory, :edit, :update, :show] 
  #resources :messages, only: [:index, :create]

  #resources :comments, only: :show
  
end

