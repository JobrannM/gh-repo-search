Rails.application.routes.draw do
  root to: 'pages#home'
  get "/search", to: 'repositories#search'
end
