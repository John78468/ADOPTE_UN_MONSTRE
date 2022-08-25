class ContractsController < ApplicationController
  # def new
  #   @monster = Monster.find(params[:monster_id])
  #   @contract = Contract.new
  #   @contract.monster = @monster
  #   @contract.user = current_user
  #   @contract.battles = 0
  # end

  def create
    monster = Monster.find(params[:monster_id])
    user = current_user
    @contract = Contract.new(contract_params)
    @contract.user = user
    @contract.monster = monster
    @contract.actif = true
    if user.coin >= (monster.price * @contract.battles) && @contract.save
      @contract.save
      user.coin = user.coin - (monster.price * @contract.battles)
      user.save
      redirect_to profil_path(user)
    else
      redirect_to monster_path(monster), alert: "Vous n'avez pas assez de pogs !"
    end
  end

  # def update
  #   @contract.update(contract_params)
  #   redirect_to profil_path(current_user)
  # end

  def decline
    @contract = Contract.find(params[:id])
    @contract.actif = false
    @contract.save
    redirect_to profil_path(current_user)
  end

  private

  def contract_params
    params.require(:contract).permit(:battles, :actif, :user_id, :monster_id)
  end
end
