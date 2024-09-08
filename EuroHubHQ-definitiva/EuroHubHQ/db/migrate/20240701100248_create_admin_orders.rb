class CreateAdminOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.string :email
      t.boolean :completed
      t.integer :total
      t.string :address

      t.timestamps
    end
  end
end
