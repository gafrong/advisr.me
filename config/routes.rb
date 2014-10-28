Rails.application.routes.draw do
  
  devise_for :users
  root 'pages#index'
  get 'pages/about' => 'pages#about'
  get 'pages/faq' => 'pages#faq'

  resources :categories
  resources :questions
  resources :answers

end
