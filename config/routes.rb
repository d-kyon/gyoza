Rails.application.routes.draw do
  root 'home#index'
  #monthly
  get 'monthly/index/:id' => 'monthly#index',as:'monthly_index'
  get 'monthly/setting/:id' => 'monthly#setting',as:'monthly_setting'
  post 'monthly/set'
  get 'monthly/set'
  delete 'monthly/delete'
  post 'monthly/edit'

  #report
  get 'report/index/:id' => 'report#index',as:'report_index'
  get 'report/show'
  post 'report/search_year'
  get 'report/search_year'

  #admin
  get 'admin/index/:id' => 'admin#index',as:'admin_index'
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
  post 'earning/target'
  get 'earning/setting/:id'  => 'earning#setting',as:'earning_setting'
  delete 'earning/delete' => 'earning#delete',as:'earning_delete'
  post 'earning/edit'

  #attendance
  get 'attendance/index/:id' => 'attendance#index',as:'attendance_index'
  get 'attendance/show/:id' => 'attendance#show',as:'attendance_show'
  post 'attendance/in_time'
  post 'attendance/out_time'
  get 'attendance/setting/:id'  => 'attendance#setting',as:'attendance_setting'
  delete 'attendance/delete' => 'attendance#delete',as:'attendance_delete'
  post 'attendance/edit'

  #home
  get 'home/index/:id' => 'home#index',as:'home_index'
  get 'home/search_month'
  post 'home/search_month'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
