class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :oauth_user_id
      t.string :token
      t.string :name
      t.string :image_url
      t.timestamps null: false
    end
  end
end
