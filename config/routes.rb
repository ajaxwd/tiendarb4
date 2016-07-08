Tienda::Application.routes.draw do
 

  resources :attachments, only: [:create,:destroy,:new,:show]
  resources :products
  resources :in_shopping_carts, only: [:create,:destroy]
  devise_for :users

  post "/emails/create", as: :create_email
  post "/pagar", to: "payments#create"
  post "/payments/cards", to: "payment#process_card"

  get "/carrito", to: "shopping_carts#show"
  get "/add/:product_id",as: :add_to_cart,to: "in_shopping_carts#create"
  get "/checkout", to: "payments#checkout"
  get "/descargar/:id", to:"links#download"
  get "/descargar/:id/archivo/:attachment_id", to:"links#dwnload_attachment"
  get "/invalid"
  
  get "/ok", to: "welcome#payment_succed"

  authenticated :user do
    root 'welcome#index'
  end

  unauthenticated :user do
    devise_scope :user do
      root "welcome#unregistered", as: :unregistered_root
    end
  end 
 
   

end
