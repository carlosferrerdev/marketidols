class AddCoordenatesToIdols < ActiveRecord::Migration[7.0]
  def change
    add_column :idols, :latitude, :float
    add_column :idols, :longitude, :float
  end
end
