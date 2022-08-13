Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  root to: "homes#top"
  resources :users,only:[:show,:edit,:update]
  resources :lists,only:[:index,:create,:destroy]
  resources :tasks,only:[:create,:edit,:update,:destroy]
  resources :challenges,only:[:index,:create,:destroy]
  resources :rewards,only:[:create,:update,:destroy]
  
  patch '/users/:id/withdrawal' => 'users#withdrawal',as:'withdrawal_user'
  
  get '/list' => 'lists#new',as:'new_list'
  
  get '/task/calendar' => 'tasks#calendar',as:'calendar_task'
  get '/task' => 'tasks#new',as:'new_task'
  get '/tasks/:id' => 'tasks#index',as:'index_tasks'
  patch '/complete_all_tasks/:id' => 'tasks#complete_all',as:'complete_all_task'
  patch '/complete_tasks/:id' => 'tasks#complete',as:'complete_task'
  delete '/destroy_all_tasks/:id' => 'tasks#destroy_all',as:'destroy_all_task'
  delete '/destroy_tags/:id' => 'tasks#destroy_tags' ,as:'destroy_tags'
  
  get '/challenge' => 'challenges#new',as:'new_challenge'
  patch '/complete_all_challenges' => 'challenges#complete_all',as:'complete_all_challenge'
  delete '/destroy_all_challenges' => 'challenges#destroy_all',as:'destroy_all_challenge'
  patch '/complete_challenges/:id' => 'challenges#complete',as:'complete_challenge'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
