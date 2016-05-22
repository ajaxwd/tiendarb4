Tienda::Application.routes.draw do
 
  resources :attachments, only: [:create,:destroy,:new,:show]
  resources :products
  devise_for :users

  post "/emails/create", as: :create_email

  authenticated :user do
    root 'welcome#index'
  end

  unauthenticated :user do
    devise_scope :user do
      root "welcome#unregistered", as: :unregistered_root
    end
  end 
 
   

end
