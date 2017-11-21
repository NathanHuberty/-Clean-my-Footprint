class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.float :km
      t.integer :number
      t.string :start_address
      t.string :destination_address
      t.references :user, foreign_key: true
      t.references :transportation, foreign_key: true
      t.references :compensation, foreign_key: true

      t.timestamps
    end
  end
end
