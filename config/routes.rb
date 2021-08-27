Rails.application.routes.draw do
  root to: 'static_pages#home'
  resources :generics
  resources :interviews do
    resources :questions
  end
end
