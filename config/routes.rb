Rails.application.routes.draw do
  get 'home/index'

  devise_for :users
  root 'upload_files#index'
  resources :upload_files do
    get 'same_tag_files', on: :collection
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
