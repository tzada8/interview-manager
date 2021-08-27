Rails.application.routes.draw do
  root to: 'static_pages#home'
  resources :generics
  # resources :questions
  resources :interviews
  get 'interviews/:id/questions', to: 'questions#index', as: 'show_questions'
  get 'interviews/:id/questions/:id', to: 'questions#show', as: 'show_question'
end
