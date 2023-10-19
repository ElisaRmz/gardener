class CreatePlantCares < ActiveRecord::Migration[7.0]
  def change
    create_table :plant_cares do |t|
      t.string :name
      t.string :month
      t.string :moon
      t.references :plant, foreign_key: true

      t.timestamps
    end
  end
end
