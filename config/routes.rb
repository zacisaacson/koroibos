Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/olympians', to: 'olympians#index'
      get '/olympian_stats', to: 'olympian_stats#show'
      get '/events', to: 'events#index'
      get '/events/:id/medalists', to: 'events#show'
    end
  end
end
