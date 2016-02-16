Rails.application.routes.draw do

  scope module: 'web' do
    #root to: ''
    resources :tasks
  end
end

