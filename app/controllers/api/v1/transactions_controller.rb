require "google/cloud/pubsub"

class Api::V1::TransactionsController < Api::V1::BaseController
  def index
    respond_with Transactions.all
  end

  def show
    respond_with transactions
  end

  def create
    puts transactions_params
    suscription.listen do |message|
      puts message
      message.acknowledge!
    end
    respond_with Transactions.create!(transactions_params)
  end

  def update
    respond_with transactions.update!(transactions_params)
  end

  def destroy
    respond_with transactions.destroy!
  end

  private

  def transactions
    @transactions ||= Transactions.find_by!(id: params[:id])
  end

  def transactions_params
    params.require(:transactions).permit
  end

  def suscription
    pubsub ||= Google::Cloud::Pubsub.new
    @suscription ||= pubsub.subscription ENV['canvas_id']
  end
end
