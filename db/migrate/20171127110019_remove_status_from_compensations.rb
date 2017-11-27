class RemoveStatusFromCompensations < ActiveRecord::Migration[5.0]
  def change
    remove_column :compensations, :status, :string
  end
end
