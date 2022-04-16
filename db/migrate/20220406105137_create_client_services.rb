class CreateClientServices < ActiveRecord::Migration[6.0]
  def change
    create_table :client_services do |t|
      t.references :client,  null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
