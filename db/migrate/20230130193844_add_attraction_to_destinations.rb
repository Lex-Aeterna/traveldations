class AddAttractionToDestinations < ActiveRecord::Migration[7.0]
  def change
    add_column :destinations, :attraction, :string
  end
end
