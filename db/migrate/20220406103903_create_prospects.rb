class CreateProspects < ActiveRecord::Migration[6.0]
  def change
    create_table :prospects do |t|
      t.references :user,                 null: false, foreign_key: true
      t.references :service,              null: false, foreign_key: true
      t.references :client,               null: false, foreign_key: true
      t.date       :scheduled_order_date, null: false
      t.integer    :license,              null: false
      t.text       :note

      t.timestamps
    end
  end
end
