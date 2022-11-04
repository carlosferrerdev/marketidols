class AddPriceToIdols < ActiveRecord::Migration[7.0]
  def change
    add_column :idols, :price, :float
  end
end
