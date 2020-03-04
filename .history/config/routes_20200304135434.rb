Rails.application.routes.draw do

  root to: "home#index"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
    
  }
  resources :super_admins
  resources :company_admin
  resources :appoinment_bookings
  resources :companies
  resources :service_center_capacities
  resources :service_center_admins
  # resources :admin do
  #   resources :admin
  # end
  get 'companies/new', to: 'companies#new'
  post 'companies', to: 'companies#create'
  get 'companies/updatecompany', to: 'companies#update'  
  get 'servicecenters/new', to:'service_centers#new'
  post 'servicecenters', to: 'service_centers#create'
  # get 'super_admin/new', to: 'super_admin#new'
  # post 'superadmins', to: 'superadmins#create'
end
