class ContractsController < ApplicationController
  def create
    @contract = Contract.new(contract)
    @contract.user = current_user
    @contract.monster = Monster.find(params[:monster_id])
    if @contract.save
      redirect_to profil_path(current_user)
    else
      render :show, status: :unprocessable_entity
    end
  end

  def update
    @contract.update(contract_params)
    redirect_to profil_path(current_user)
  end

  def decline
    @contract = contract.find(params[:id])
    @contract.actif = false
    @contract.save
  end

  private

  def contract_params
    params.require(:contract).permit(:battles, :actif, :user_id, :monster_id)
  end
end
