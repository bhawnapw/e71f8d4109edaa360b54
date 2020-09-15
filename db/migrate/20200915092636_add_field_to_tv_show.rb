class AddFieldToTvShow < ActiveRecord::Migration[6.0]
  def change
  	add_column :tv_shows, :notification_job_id, :string
  end
end
