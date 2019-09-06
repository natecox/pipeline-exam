# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    resources :deal_stages, only: [:index]
  end

  resources :deals, only: [:index]
  root 'deals#index'
end
