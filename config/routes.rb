Rails.application.routes.draw do
  resources :comments
  devise_for :users, path:'', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}

  root to: 'pages#home'
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'tech-news', to: 'pages#tech_news'

  resources :catalogs, path: 'portfolios', except: [:show] do
    put :sort, on: :collection #on portfolios/sort do something else
  end

  get 'portfolio/:id', to: 'catalogs#show', as: 'portfolio_show'
  get 'angular-items', to: 'catalogs#angular'

  resources :blogs do
    member do
      get :toggle_status
    end
  end
end
