Rails.application.routes.draw do
  get 'static/homepage'

  root to: 'static#homepage'
end
