class CreatePlaceGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :place_genres do |t|
      t.references :genre, null: false, foreign_key: true
      t.references :place, null: false, foreign_key: true

      t.timestamps
    end
  end
end
