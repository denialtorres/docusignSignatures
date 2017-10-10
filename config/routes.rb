Rails.application.routes.draw do
  get 'home/index'

  get 'home/result'
  
  post 'home/download_document'
  
  post 'home/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :docusign do 
      resources :webhooks, only: [:create]
  end
  
  root "home#index"
end
