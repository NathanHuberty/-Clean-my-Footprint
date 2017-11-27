class RemoveAmountFromCompensations < ActiveRecord::Migration[5.0]
  def change
    remove_column :compensations, :amount, :float
  end
end
