class AddLogIdToTags < ActiveRecord::Migration[8.1]
  def change
    add_column :tags, :log_id, :integer
  end
end
