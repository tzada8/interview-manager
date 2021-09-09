Rails.application.routes.draw do
  devise_for :users
  root to: 'static_pages#home'
  get '/about', to: 'static_pages#about', as: 'about'
  resources :generics
  resources :interviews do
    resources :specifics
  end
  resources :my_questions

  resources :questions
end
