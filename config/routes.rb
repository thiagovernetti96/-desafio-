Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  api_version(module: 'V1', path: {value: 'v1'}) do
    post '/callback', to: 'webhooks#callback'
    resources :events, only: [:index]
    get '/issues/:number/events', to: 'events#issues'
  end
end
