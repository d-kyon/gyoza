Rails.application.routes.draw do

  #admin
  get 'admin/index'
  get 'admin/show/:id' => 'admin#show',as:'admin_show'
  get 'admin/attendance/:id' => 'admin#attendance',as:'admin_attendance'
  get 'admin/earning/:id' => 'admin#earning',as:'admin_earning'
  post 'admin/earning_between'
  get 'admin/earning_between'
  post 'admin/attendance_between'
  get 'admin/attendance_between'

  #earning
  get 'earning/index/:id' => 'earning#index',as:'earning_index'
  get 'earning/show' => 'earning#show',as:'earning_show'
  post 'earning/earn'

  #attendance
  get 'attendance/index/:id' => 'attendance#index',as:'attendance_index'
  get 'attendance/show/:id' => 'attendance#show',as:'attendance_show'
  post 'attendance/in_time'
  post 'attendance/out_time'

  #home
  root 'home#index'
  get 'home/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
