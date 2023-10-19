class CreateSeededPlantCareTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :seeded_plant_care_tasks do |t|
      t.datetime :done
      t.references :seeded_plant, foreign_key: true

      t.timestamps
    end
  end
end
