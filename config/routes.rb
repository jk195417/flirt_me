Rails.application.routes.draw do
  # 帳號管理
  devise_for :users
  
  # 首頁
  root to: 'pages#index'
  resources :pages, only: [] do
    collection do
      get 'index'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
