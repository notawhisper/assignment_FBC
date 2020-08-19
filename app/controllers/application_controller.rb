class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def authenticate_user
     @current_user = User.find_by(id: session[:user_id])
     if @current_user == nil
       flash[:notice] = "ログインが必要です。"
       redirect_to new_session_path
     end
  end

  def recognize_user
    current_user = User.find_by(id: session[:user_id]).id
    unless current_user == @picture.user_id
      flash[:notice] = "この操作は本人のみに許可されています。"
      redirect_to pictures_path
    end
  end
end
