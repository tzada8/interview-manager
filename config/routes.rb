Rails.application.routes.draw do
  devise_for :users
  root to: 'static_pages#home'
  resources :generics
  resources :interviews do
    resources :questions
  end
  resources :my_questions
end
