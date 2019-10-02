class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.string :backdrop_path
      t.string :name 
      t.string :overview 
      t.string :db_id


      t.timestamps
    end
  end
end
