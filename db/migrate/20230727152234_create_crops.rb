class CreateCrops < ActiveRecord::Migration[7.0]
  def change
    create_table :crops do |t|
      t.string :name
      t.string :month
      t.string :moon
      t.index :biology_id

      t.timestamps
    end
  end
end
