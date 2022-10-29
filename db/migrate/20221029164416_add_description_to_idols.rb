class AddDescriptionToIdols < ActiveRecord::Migration[7.0]
  def change
    add_column :idols, :description, :text
  end
end
