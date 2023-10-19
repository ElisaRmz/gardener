class CreatePlantCrops < ActiveRecord::Migration[7.0]
  def change
    create_table :plant_crops do |t|
      t.string :name
      t.string :month
      t.string :moon
      t.index :plant_biology_id

      t.timestamps
    end
  end
end
