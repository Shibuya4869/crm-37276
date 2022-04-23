class CreateServiceProspects < ActiveRecord::Migration[6.0]
  def change
    create_table :service_prospects do |t|
      t.references :service,  null: false, foreign_key: true
      t.references :prospect, null: false, foreign_key: true

      t.timestamps
    end
  end
end
