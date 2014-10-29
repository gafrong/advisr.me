Rails.application.routes.draw do
  
  devise_for :users
  root 'questions#new'
  get 'pages/about' => 'pages#about'
  get 'pages/faq' => 'pages#faq'

  resources :categories
  resources :questions
  resources :answers
  resources :comments

end
