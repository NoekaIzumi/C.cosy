Rails.application.routes.draw do
  namespace :admin do
    get 'user/index'
    get 'user/show'
    get 'user/edit'
    get 'user/favorite'
    get 'user/follow'
    get 'user/follower'
  end
  namespace :user do
    resources :post
    get 'relationship/follow'
    get 'relationship/unfollow'
    get 'relationship/followed'
    get 'relationship/unfollowed'
    get 'favorite/create'
    get 'favorite/destroy'
    get 'user/show'
    get 'user/edit'
    get 'user/favorite'
    get 'user/follow'
    get 'user/follower'
  end



  root "home#top"#Top
  get 'home/about',to: 'home#about' , as: 'about'#about


  #管理者側
  devise_for :admins,
   skip: [:registrations, :passwords],#不要なルーティングを削除
   controllers: {
   sessions: "admin/sessions"
}
   get 'admin'=> 'admin/post#index'#管理者トップページ


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
