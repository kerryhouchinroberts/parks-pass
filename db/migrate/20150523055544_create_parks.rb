class CreateParks < ActiveRecord::Migration
  def change
    create_table :parks do |t|
      t.string :name
      t.string :location
      t.string :latitude
      t.string :longitude
      t.string :established
      t.timestamps null: false
    end
  end
end
