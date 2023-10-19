class CreatePlants < ActiveRecord::Migration[7.0]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :family
      t.string :light
      t.string :humidity
      t.string :root_depth
      t.integer :root_diameter
      t.integer :maximum_temperature
      t.integer :minimum_temperature
      t.integer :germination_temperature

      t.timestamps
    end
  end
end
