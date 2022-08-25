class MonstersController < ApplicationController
  def index
    # params['specie'].present? && params['specie'] != "all" ? @specie = params['specie'] : @specie = ['golem', 'garou', 'troll']
    @specie = search('specie', ['golem', 'garou', 'troll'])
    # @level = search('level', 0)
    # @price = search('price', 0)

    @monsters = Monster.where(actif: true, specie: @specie)
    # @monsters = Monster.where(actif: true, specie: @specie).where("level < ?", @level).where("price < ?", @price)
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
    @contract = Contract.new
    @contract.monster = @monster
    @contract.user = current_user
    @contract.battles = 0
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

  private

  def monster_params
    params.require(:monster).permit(:name, :specie, :description, :image, :price)
  end

  def search(val, output)
    if params[val].present? && !params[val].nil?
      @result = params[val]
    else
      @result = output
    end
    return @result
  end
end
