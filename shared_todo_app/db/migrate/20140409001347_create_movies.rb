class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.float :rating
      t.boolean :watched
      t.text :notes

      t.timestamps
    end
  end
end
