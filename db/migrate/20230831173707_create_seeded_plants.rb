class CreateSeededPlants < ActiveRecord::Migration[7.0]
  def change
    create_table :seeded_plants do |t|
      t.string :description
      t.references :land, foreign_key: true
      t.references :plant, foreign_key: true

      t.timestamps
    end
  end
end
