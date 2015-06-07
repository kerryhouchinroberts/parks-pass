class AddDropboxToParks < ActiveRecord::Migration
  def change
    add_column :parks, :dropbox, :string
  end
end
