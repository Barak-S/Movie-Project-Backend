class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :Title
      t.string :Poster
      t.string :imdbRating
      t.string :Plot
      t.string :imdbID

      t.timestamps
    end
  end
end
