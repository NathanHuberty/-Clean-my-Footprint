class AddAmountToCompensations < ActiveRecord::Migration[5.0]
  def change
    # add_column :compensations, :amount, :monetize
    # t.monetize :amount, currency: { present: false }
    add_monetize :compensations, :amount, currency: { present: false }

  end
end
