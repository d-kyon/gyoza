Rails.application.routes.draw do
  root 'home#index'

  #admin
  get 'admin/index'
  get 'admin/show/:id' => 'admin#show',as:'admin_show'
  get 'admin/attendance/:id' => 'admin#attendance',as:'admin_attendance'
  get 'admin/earning/:id' => 'admin#earning',as:'admin_earning'
  post 'admin/earning_search_month'
  get 'admin/earning_search_month'
  post 'admin/attendance_search_month'
  get 'admin/attendance_search_month'
  post 'admin/search_month'
  get 'admin/search_month'

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
  get 'home/index'
  get 'home/search_month'
  post 'home/search_month'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
