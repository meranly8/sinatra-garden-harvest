class CreateCrops < ActiveRecord::Migration
  def change
    create_table :crops do |t|
      t.string :name
      t.integer :quantity
      t.string :season
      t.integer :year
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
