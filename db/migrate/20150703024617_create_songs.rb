class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.string :album
      t.string :popularity

      t.timestamps null: false
    end
  end
end
