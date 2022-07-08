Rails.application.routes.draw do
  
  devise_for :users
  
  root to: "homes#top"
  resources :users,only:[:show,:edit,:update]
  resources :lists,only:[:index,:create,:destroy]
  patch '/users/:id/withdrawal' => 'users#withdrawal',as:'withdrawal_user'
  get '/list' => 'lists#new',as:'new_list'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
