Rails.application.routes.draw do
  get 'plant_management_slips/index'
  get 'plant_management_slips/new'
  get 'plant_management_slips/show'
  # get 'plant_basic_data/index'
  root 'static_pages#top'
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  resources :users, :only => [:show] do
    resources :plant_basic_data, :only => [:create, :new, :edit, :index, :show, :destroy, :update]
    resources :plant_management_slips, :only => [:create, :new, :edit, :index, :show, :destroy, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
