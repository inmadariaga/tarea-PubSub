require "google/cloud/pubsub"

class Api::V1::TransactionsController < Api::V1::BaseController
  def index
    respond_with Transaction.all
  end

  def show
    respond_with transaction
  end

  def create
    puts transactions_params
    respond_with Transaction.create!(transactions_params)
  end

  def update
    respond_with transaction.update!(transactions_params)
  end

  def destroy
    respond_with transaction.destroy!
  end

  private

  def transaction
    @transaction ||= Transaction.find_by!(id: params[:id])
  end

  def transactions_params
    params.require(:transaction).permit
  end
end
