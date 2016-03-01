Rails.application.routes.draw do

  scope module: 'web' do
    root to: 'tasks#index'
    resources :tasks do
      scope module: 'tasks' do
        resources :state, only: :update
      end
    end
  end
end

