Rails.application.routes.draw do

  ## 顧客用
  # URL /customers/sign_in ...
  devise_for :customer,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  root to: 'public/homes#top'
  get '/about' => 'public/homes#about'

  resources :items, only: [:index,
                           :show]

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