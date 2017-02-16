require 'sidekiq/web'

Rails.application.routes.draw do
  post 'callback', to: 'top#callback'
  resources :offers, only: [:create, :show] do
    get 'mentions', on: :member
  end
  get 'line', to: 'top#line'
  root to: 'top#index'
end
