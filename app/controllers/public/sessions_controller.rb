# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :customer_state, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  # ログインした遷移先
  def after_sign_in_path_for(resource)
     customers_mypage_path
  end

  # ログアウトした遷移先
  def after_sign_out_path_for(resource)
     customer_session_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def customer_state
    @customer = Customer.find_by(email: params[:customer][:email])
    @customer.valid_password?(params[:customer][:password])
    if (@customer.valid_password?(params[:customer][:password])) && (@customer.is_deleted == true)
      redirect_to  new_customer_registration_path
    end
  end

end
