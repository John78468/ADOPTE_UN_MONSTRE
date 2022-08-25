class MonstersController < ApplicationController
  def index
    @monsters = Monster.all
  end

  def new
    @monster = Monster.new
  end

  def create
    @monster = Monster.new(monster_params)
    @monster.user = current_user
    if @monster.save
      redirect_to monster_path(@monster)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @monster = Monster.find(params[:id])
  end

  def edit
    @monster = Monster.find(params[:id])
  end

  def update
    if @monster.update
      redirect_to monster_path
    else
      render :update, status: :unprocessable_entity
    end
  end

  def destroy
    @monster = Monster.find(params[:id])
    if @monster.present?
      @monster.destroy
      redirect_to monsters_path, status: :see_other
    end
  end

  def off
    activate(false)
  end

  def on
    activate(true)
  end

  private

  def activate(val)
    @monster = Monster.find(params[:id])
    @monster.actif = val
    @monster.save
    redirect_to profil_path(current_user)
  end

  def monster_params
    params.require(:monster).permit(:name, :specie, :description, :image, :price)
  end
end
