Rails.application.routes.draw do

  resources :employees do
    get '(page/:page)', action: :index, on: :collection
  end
  
  get 'getting_data_for_api', to: "employees#getting_data_for_api"
  root to: 'employees#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
