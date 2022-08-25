class ContractsController < ApplicationController

  def new
    @monster = Monster.find(params[:monster_id])
    @contract = Contract.new
    @contract.monster = @monster
    @contract.user = current_user
    @contract.battles = 0
  end

  def create
    @contract = Contract.new(contract_params)
    @contract.user = current_user
    @contract.monster = Monster.find(params[:monster_id])
    @contract.actif = true
    if @contract.save
      redirect_to profil_path(current_user)
    else
      render :new, status: :unprocessable_entity
      # redirect_to profil_path(current_user)
    end
  end

  def update
    @contract.update(contract_params)
    redirect_to profil_path(current_user)
  end

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
