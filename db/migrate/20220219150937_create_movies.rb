class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :director
      t.string :cinematographer
      t.string :slug
      t.integer :duration
      t.integer :release_year
      t.text :starring
      t.text :description
      t.text :awards
      t.string :image1
      t.string :image2
      t.string :image3

      t.timestamps
    end
  end
end
