class AddRecIdToParks < ActiveRecord::Migration
  def change
    add_column :parks, :rec_id, :integer
  end
end
