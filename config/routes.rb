Rails.application.routes.draw do
  namespace :admin do
    resources :user do
      patch 'suspend', on: :member # ユーザーを利用停止にするルート
     resources :follow,only: [:index] # フォロー一覧
     resources :followed,only: [:index] # フォロワー一覧
     resources :comments, only: [:index, :destroy]#コメント一覧/削除
    end
    resources :post, only: [:show, #投稿管理画面
      ] do
      resources :comments, only: [:index,:destroy]#コメント管理
      resources :favorite,only: [:index] # お気に入り一覧
    end


  end
  namespace :user do
    resources :post do
      resources :favorite,only: [:create,:destroy]
      resources :comments, only:[:create, :destroy]#コメント機能
    end
    #resources :relationship,only: [:follow,:unfollow,:followed,:unfollowed]
    resources :user, only: [:edit, :show,:favorite,:follow,:follower,:update] do
      member do
      get :follows, :followers
    end
      resources :follow,only: [:create,:destroy,:index]
      resources :followed,only: [:create,:destroy,:index]
      resources :favorite,only: [:index]
      resources :relationship, only: [:create, :destroy]
    end
  end




  root "home#top"#Top
  get 'home/about',to: 'home#about' , as: 'about'#about
  get 'search',to: 'home#search', as: 'search'#検索画面


  #管理者側
  devise_for :admins,
   skip: [:registrations, :passwords],#不要なルーティングを削除
   controllers: {
   sessions: "admin/sessions"
}
  get 'admin/posts',to: 'admin/post#index',as: 'admin'#管理者トップページ
  get 'admin/user/:id/posts', to: 'admin/post#index_user', as: 'user_posts'#各ユーザーの投稿一覧
  get 'admin/user/:id/comments', to: 'admin/post#comments', as: 'user_comments' # 各ユーザーのコメント一覧


  #ユーザー側
  devise_for :users,
   skip: [:passwords],#不要なルーティングを削除
   controllers: {
   registrations: "user/registrations",
   sessions: 'user/sessions'
  }

  get 'posts',to:  'user/post#index' , as: 'posts'#ユーザートップページ


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
