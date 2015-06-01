class ChangeParks < ActiveRecord::Migration
  def change
    add_column :parks, :main_image, :string
  end
end
