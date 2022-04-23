class AddreferencesToProspects < ActiveRecord::Migration[6.0]
  def change
    add_reference :prospects, :user, foreign_key: true
    add_reference :prospects, :service, foreign_key: true
    add_reference :prospects, :client, foreign_key: true
  end
end
