class AddmessageIdToTransaction < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :message_id, :bigint
  end
end
