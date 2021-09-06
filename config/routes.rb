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
  post 'interviews/:interview_id/specifics/create_specific', to: 'specifics#create_specific', as: 'create_specific'
  patch 'interviews/:interview_id/specifics/:id/update_specific', to: 'specifics#update_specific', as: 'update_specific'
  delete 'interviews/:interview_id/specifics/:id/delete_specific', to: 'specifics#delete_specific', as: 'delete_specific'
end
