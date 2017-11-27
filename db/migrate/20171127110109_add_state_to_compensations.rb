class AddStateToCompensations < ActiveRecord::Migration[5.0]
  def change
    add_column :compensations, :state, :string
  end
end
