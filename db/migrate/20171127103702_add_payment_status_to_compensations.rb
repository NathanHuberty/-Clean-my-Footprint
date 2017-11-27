class AddPaymentStatusToCompensations < ActiveRecord::Migration[5.0]
  def change
    add_column :compensations, :status, :string
    add_column :compensations, :payment, :jsonb
  end
end
