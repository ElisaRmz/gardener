class CreatePlantBiologies < ActiveRecord::Migration[7.0]
  def change
    create_table :plant_biologies do |t|
      t.string :name
      t.string :family
      t.string :light
      t.string :humidity
      t.integer :root_diameter
      t.string :root_depth
      t.integer :maximum_temperature
      t.integer :minimun_temperature
      t.integer :germation_temperature

      t.timestamps
    end
  end
end
