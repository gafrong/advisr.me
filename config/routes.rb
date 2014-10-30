Rails.application.routes.draw do

  root 'questions#new'

  devise_for :users

  get 'pages/about' => 'pages#about'
  get 'pages/faq' => 'pages#faq'
  get '/about' => 'pages#about'


  resources :categories
  resources :questions
  resources :answers
  resources :comments

end
