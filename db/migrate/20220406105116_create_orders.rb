class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :user_id,    null: false
      t.integer :service_id, null: false
      t.integer :client_id,  null: false
      t.date :order_date,    null: false
      t.date :expiry,        null: false
      t.integer :license,    null: false
      t.text :note

      t.timestamps
    end
  end
end
