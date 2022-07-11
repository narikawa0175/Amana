Rails.application.routes.draw do
  
  get 'tasks/index'
  get 'tasks/new'
  get 'tasks/edit'
  devise_for :users
  
  root to: "homes#top"
  resources :users,only:[:show,:edit,:update]
  resources :lists,only:[:index,:create,:destroy]
  resources :tasks,only:[:create,:edit,:update,:destroy]
  patch '/users/:id/withdrawal' => 'users#withdrawal',as:'withdrawal_user'
  get '/list' => 'lists#new',as:'new_list'
  get '/task' => 'tasks#new',as:'new_task'
  patch '/complete_all_tasks/:id' => 'tasks#complete_all',as:'complete_all_task'
  get '/tasks/:id' => 'tasks#index',as:'index_tasks'
  patch '/complete_tasks/:id' => 'tasks#complete',as:'complete_task'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
