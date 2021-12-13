class RemoveColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :transactions, :messageId
  end
end
