class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user,    null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true
      t.references :client,  null: false, foreign_key: true
      t.date :order_date,    null: false
      t.date :expiry,        null: false
      t.integer :license,    null: false
      t.text :note

      t.timestamps
    end
  end
end
