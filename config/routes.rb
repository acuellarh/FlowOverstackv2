Rails.application.routes.draw do
  root 'questions#index'
  
  devise_for :users
  
  resources :questions do
    resources :answers
    resources :comments 
  end  
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html  
end
