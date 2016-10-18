Rails.application.routes.draw do
  
  resources :plans
  def home
    @latest_feed = Feed.order(:id).last
  end

  get 'pages/privacy'
  get 'responses/show'
  get 'responses/edit'

  resources :responses do
    resources :responses
  end
 
  resources :feeds do
    resources :responses
  end
  
  devise_for :users
  
  root 'pages#home'
  get 'profiles/show'
  get ':name', to: 'profiles#show', as: :profile

  mount Bootsy::Engine => '/bootsy', as: 'bootsy'

  resources :reviews do
    resources :reviews
  end
 
  resources :plans do
    resources :reviews
  end
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end