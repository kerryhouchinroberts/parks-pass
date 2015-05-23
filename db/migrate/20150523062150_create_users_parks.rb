class CreateUsersParks < ActiveRecord::Migration
  def change
    create_table :users_parks, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :park, index: true
    end
  end
end
