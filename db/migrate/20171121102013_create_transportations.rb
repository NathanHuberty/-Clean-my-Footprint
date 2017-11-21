class CreateTransportations < ActiveRecord::Migration[5.0]
  def change
    create_table :transportations do |t|
      t.string :category
      t.float :emission

      t.timestamps
    end
  end
end
