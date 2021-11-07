class ApplicationController < ActionController::Base
  before_action :basic_auth
  # before_action :authenticate_user!
  # before_action :move_to_index, except: [:index]
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222'
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_day])
    # devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday])
  end

  # def move_to_index
  #   unless user_signed_in?
  #     redirect_to action: :index
  #   end
  # end
end

# データベース　と　ビューページの名前　と　コントローラーで許可するキーの名前
