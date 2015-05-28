class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.date :start_date
      t.date :end_date
      t.text :notes
      t.json :park_photos
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :park, index: true, foreign_key: true
    end
  end
end
