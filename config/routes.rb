Rails.application.routes.draw do
  root to: 'static_pages#home'
  resources :generics
  # resources :questions
  resources :interviews
  get 'interviews/:id/questions', to: 'questions#index', as: 'questions'
  get 'interviews/:id/questions/:id', to: 'questions#show', as: 'question'
end
