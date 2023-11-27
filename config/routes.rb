Rails.application.routes.draw do

  root "home#top"#Top
  get 'home/about',to: 'homes#about' , as: 'about'#about


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
  
  get 'posts' => 'user/post#index'#ユーザートップページ
  
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
