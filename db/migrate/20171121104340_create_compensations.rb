class CreateCompensations < ActiveRecord::Migration[5.0]
  def change
    create_table :compensations do |t|
      t.references :project, foreign_key: true
      t.float :amount

      t.timestamps
    end
  end
end
