class AddAddressToIdols < ActiveRecord::Migration[7.0]
  def change
    add_column :idols, :address, :string
  end
end
