Rails.application.routes.draw do

  devise_for :users
  root 'homes#top'
  get 'home/about' => 'homes#about' ,as: "about"
  resources :users do
    resource :relationship, only: [:create, :destroy] 
    get "followings" => "relationships#followings", as: "followings"
  	get "followers" => "relationships#followers", as: "followers"
  end
  resources :books do
    resource :favorite, only: [:create, :destroy] 
    resources :book_comments, only: [:create, :destroy]
  end
end
