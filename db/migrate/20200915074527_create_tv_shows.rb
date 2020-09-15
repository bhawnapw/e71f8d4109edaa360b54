class CreateTvShows < ActiveRecord::Migration[6.0]
  def change
    create_table :tv_shows do |t|
      t.references :channel, index: true
      t.string :name
      t.string :timing
      t.timestamps
    end
  end
end
