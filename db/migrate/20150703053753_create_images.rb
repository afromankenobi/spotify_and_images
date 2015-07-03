class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :data
      t.integer :song_id
    end
  end
end
