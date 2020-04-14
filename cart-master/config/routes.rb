Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'books#top'
  resources :books do
  resources :cart_items, only: [:index, :create, :update, :destroy]
 end
 delete :cart_items, to: 'cart_items#destroy_all'
end
