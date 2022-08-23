class ContractsController < ApplicationController
  def create
    @contract = Contract.new(contract)
    @contract.user = @user
    if @contract.save
      redirect_to profil_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @contract = Contract.update(contract_params)
    redirect_to profil_path(@user)
  end

  private

  def contract_params
    params.require(:contract).permit(:battles, :actif, :user_id, :monster_id)
  end
end
