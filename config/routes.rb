Rails.application.routes.draw do

  root to: 'pages#home'
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :catalogs
  resources :blogs
end
