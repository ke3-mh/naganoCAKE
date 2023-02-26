Rails.application.routes.draw do

  ## 顧客用
  # URL /customers/sign_in ...
  devise_for :customer,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # customerr



  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'

    get 'customers/mypage' => 'customers#show'
    get 'customers/infomation/edit' => 'customers#edit'
    patch 'customers/infomation' => 'customers#update'
    get 'customers/confirm' => 'customers#confirm'
    patch 'customers/withdraw' => 'customers#withdraw'

    resources :items, only: [:index,
                             :show]
  end

# ---------------------------------------------------------------------------- #

  ## 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get '/' => 'homes#top'

    resources :items, only: [:index,
                             :new,
                             :show,
                             :create,
                             :edit,
                             :update]

    resources :customers, only: [:index,
                                 :show,
                                 :edit,
                                 :update]

    resources :orders, only: [:show,
                              :update]

    resources :order_items, only: [:update]

  end

end