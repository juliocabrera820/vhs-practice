class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.integer :length
      t.string :description
      t.string :director

      t.timestamps
    end
  end
end
