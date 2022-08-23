class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def profil
    @user = User.find(params[:id])
  end

  def profil_update
    if @user.update(user_params)
      redirect_to profil_path(@user)
    else
      render :profil, status: :unprocessable_entity
    end
  end
end
