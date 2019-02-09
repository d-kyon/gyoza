Rails.application.routes.draw do
  get 'earning/index/:id' => 'earning#index',as:'earning_index'
  get 'earning/show' => 'earning#show',as:'earning_show'
  post 'earning/earn'
  get 'attendance/index/:id' => 'attendance#index',as:'attendance_index'
  get 'attendance/show/:id' => 'attendance#show',as:'attendance_show'
  post 'attendance/in_time'
  post 'attendance/out_time'
  root 'home#index'
  get 'home/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
