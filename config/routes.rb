Rails.application.routes.draw do
  resources :cadastros, only: [:create]
end
