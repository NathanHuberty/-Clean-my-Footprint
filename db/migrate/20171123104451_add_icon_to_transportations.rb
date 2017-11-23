class AddIconToTransportations < ActiveRecord::Migration[5.0]
  def change
    add_column :transportations, :icon, :string
  end
end
