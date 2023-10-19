class CreateCrops < ActiveRecord::Migration[7.0]
  def change
    create_table :crops do |t|
      t.string :name
      t.string :month
      t.string :moon
      t.references :biology, foreign_key: true

      t.timestamps
    end
  end
end
