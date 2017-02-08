require 'sidekiq/web'

Rails.application.routes.draw do
  post 'callback', to: 'top#callback'
  resources :offers, only: [:create, :show] do
    get 'mentions', on: :member
  end
  root to: 'top#index'
end
