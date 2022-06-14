Rails.application.routes.draw do

  namespace :admin do
    get 'homes/top'
    resources :posts, only: [:show, :edit, :update]
    resources :users, only: [:show, :edit, :update]
  end
  namespace :public do
    get 'users/home' => "users#home"
    get "searches", to: "searches#searches_result"
    get 'posts/get_city', to: 'posts#get_city'
    get 'homes/about'
    get 'users/confirm'
    patch 'users/unsubscribe'
    resources :posts do  #postsコントローラへのルーティング  
      resources :comments, only: [:create, :destroy]  #commentsコントローラへのルーティング
    end
    resources :posts, only: [:show, :new, :create, :update]
    resources :posts do
      resource :favorites, only: [:create, :destroy]
    end
    resources :users, only: [:show, :edit, :update, ]
    resources :users do
      resource :follows, only: [:create, :destroy]
      get 'followings' => 'follows#followings', as: 'followings'
      get 'followers' => 'follows#followers', as: 'followers'
    end
  end
  


  
  root to: "public/homes#top"
  
  devise_for :users,controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin,skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
