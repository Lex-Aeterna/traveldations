class CreateTraveldations < ActiveRecord::Migration[7.0]
  def change
    create_table :traveldations do |t|
      t.string :country
      t.string :city
      t.text :description
      t.timestamps
    end
  end
end
