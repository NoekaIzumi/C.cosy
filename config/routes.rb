Rails.application.routes.draw do
  namespace :admin do
    resources :user do
      resources :posts, only: [:index, :show] # 各ユーザーの投稿一覧と詳細
      resources :comments, only: [:index] # 各ユーザーのコメント一覧
      patch 'suspend', on: :member # ユーザーを利用停止にするルート
    end
    get 'user/favorite', to: 'user#favorite' # お気に入り一覧
    get 'user/follow', to: 'user#follow' # フォロー一覧
    get 'user/follower', to: 'user#follower' # フォロワー一覧
    resources :posts, only: [:show] # 投稿詳細
  end
  namespace :user do
    resources :post
    resources :relationship,only: [:follow,:unfollow,:followed,:unfollowed]
    resources :favorite,only: [:create,:destroy]
    resources :users, only: [:edit, :show,:favorite,:follow,:follower,:update]
  end



  root "home#top"#Top
  get 'home/about',to: 'home#about' , as: 'about'#about


  #管理者側
  devise_for :admins,
   skip: [:registrations, :passwords],#不要なルーティングを削除
   controllers: {
   sessions: "admin/sessions"
}
  get 'admin/posts',to: 'admin/post#index',as: 'admin'#管理者トップページ



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
