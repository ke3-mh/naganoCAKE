Rails.application.routes.draw do

  ## 顧客用
  # URL /customers/sign_in ...
  devise_for :customer,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  root to: 'public/homes#top'

  get 'customers/mypage' => 'public/customers#show'

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
  end

end