Rails.application.routes.draw do
  devise_for :users
  get 'static/homepage'

  root to: 'static#homepage'
end
