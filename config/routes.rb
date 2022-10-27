Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  scope module:  'api' do
    namespace :v1 do
      resources :jobs do
        match 'mark_deleted', to: 'jobs#mark_deleted', via: 'put'
        resources :applies
      end
      resources :geeks do
        match 'mark_deleted', to: 'jobs#mark_deleted', via: 'put'
        resources :jobs
      end
      resources :companies do
        match 'mark_deleted', to: 'jobs#mark_deleted', via: 'put'
        resources :jobs
      end
    end
  end
  match "*path", to: "application#catch_404", via: :all
end
