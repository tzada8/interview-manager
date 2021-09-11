Rails.application.routes.draw do
  devise_for :users
  # STATIC PAGES
  root to: 'static_pages#home'
  get '/about', to: 'static_pages#about', as: 'about'
  # GENERICS
  resources :generics
  get 'generics/:id/add_to_interview', to: 'generics#add_to_interview', as: 'add_to_interview'
  patch 'generics/:id/create_interview_specific', to: 'generics#create_interview_specific', as: 'create_interview_specific'
  # INTERVIEWS
  resources :interviews do
    # SPECIFICS
    resources :specifics
  end
  # MY QUESTIONS
  resources :my_questions
end
