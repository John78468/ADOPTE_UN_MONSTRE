class MonstersController < ApplicationController
  def index
    @monsters = Monster.all
  end

  def new
    @monster = Mosnter.new
  end

  def show
    @monster = Monster.find(params[:id])
  end

  def edit
  end

  def update
  end


  def create
  end

  def destroy
  end

  private

  def monster_params
    params.require(:monster).permit(:name, :specie, :description, :image, :price, :user_id)
  end
end
