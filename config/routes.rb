Rails.application.routes.draw do

  root to: 'pages#home'
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :catalogs, path: 'portfolios', except: [:show]
  get 'portfolio/:id', to: 'catalogs#show', as: 'portfolio_show'

  resources :blogs do
    member do
      get :toggle_status
    end
  end
end
