class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  helper_method :resource_name, :resource, :devise_mapping, :resource_class
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def home
  end

  def profil
    @user = User.find(params[:id])
  end



  private

  def user_params
    params.require(:user).permit(:name, :avatar, :coin,)
  end
end
