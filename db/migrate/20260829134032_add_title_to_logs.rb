class AddTitleToLogs < ActiveRecord::Migration[8.1]
  def change
    add_column :logs, :title, :string
  end
end
