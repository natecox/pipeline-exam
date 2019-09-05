# frozen_string_literal: true

Rails.application.routes.draw do
  resources :deals, only: [:index]
  root 'deals#index'
end
