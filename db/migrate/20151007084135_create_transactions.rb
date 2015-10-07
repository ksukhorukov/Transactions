class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.float :amount
      t.string :type
      t.integer :parent_id, :limit => 8
    end
  end
end
