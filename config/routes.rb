Rails.application.routes.draw do
  root 'basic_pages#home'
  
  get 'basic_pages/home', to: 'basic_pages#home'
  get 'basic_pages/team', to: 'basic_pages#team'
  get 'basic_pages/contact', to: 'basic_pages#contact'
  get 'basic_pages/welcome/:first_name', to: 'basic_pages#welcome'

  resources :gossips
  resources :user
  resources :city
  
  resources :gossips do
    resources :comments
   end

  resources :sessions, only:[:new, :create, :destroy]
  resources :gossips do
    resources :likes
   end
 


  get "up" => "rails/health#show", as: :rails_health_check
end
