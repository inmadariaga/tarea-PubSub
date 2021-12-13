class AddFieldsToTransaction < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :operation, :int
    add_column :transactions, :transaction_id, :int
    add_column :transactions, :origin_bank, :int
    add_column :transactions, :origin_account, :int
    add_column :transactions, :destination_bank, :int
    add_column :transactions, :destination_account, :int
    add_column :transactions, :amount, :int
    add_column :transactions, :messageId, :int
    add_column :transactions, :publishTime, :string
  end
end
