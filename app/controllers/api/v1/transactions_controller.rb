require "google/cloud/pubsub"

class Api::V1::TransactionsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token

  def index
    respond_with Transaction.all
  end

  def show
    respond_with transaction
  end

  def create
    decoded_data = decode(transactions_params["data"])
    if decoded_data.length == 64
      params = elements(decoded_data, transactions_params["messageId"].to_i), transactions_params["publishTime"])
    else
      puts "NO"
    end
    respond_with Transaction.create!(params)
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
    params.require(:message).permit(:attributes, :data, :messageId, :message_id, :publishTime, :publish_time)
  end

  def decode(data)
    return Base64.decode64(data)
  end

  def elements(decoded_data, messageId, publishTime)
    operation = decoded_data[0..3].to_i
    id = decoded_data[4..13].to_i
    origin_bank = decoded_data[14..20].to_i
    origin_account = decoded_data[21..30].to_i
    destination_bank = decoded_data[31..37].to_i
    destination_account = decoded_data[38..47].to_i
    amount = decoded_data[48..63].to_i
    return { operation: operation, transaction_id: id, origin_bank: origin_bank, origin_account: origin_account, destination_bank: destination_bank, destination_account: destination_account, amount: amount, messageId: messageId, publishTime: publishTime }
  end
end
