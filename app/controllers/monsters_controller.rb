class MonstersController < ApplicationController
  def index
    @monsters = Monster.all
  end

  def new
    @monster = Monster.new
  end

  def create
    @monster = Monster.new
    if @monster.save
      redirect_to monster_path
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
    @monster = Monster.find(monster_params)
    if @monster.update
      redirecto_to monster_path
    else
      render :update, status: :unprocessable_entity
    end
  end

  def destroy
    @monster = Monster.find(monster_params)
    if @monster.destroy
      redirecto_to monsters_path
    else
      render :destroy, status: :unprocessable_entity
    end
  end

  private

  def monster_params
    params.require(:monster).permit(:name, :specie, :description, :image, :price)
  end
end
