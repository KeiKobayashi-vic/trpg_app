class AddPcToLogs < ActiveRecord::Migration[8.1]
  def change
    add_column :logs, :pc1, :string
    add_column :logs, :pc2, :string
    add_column :logs, :pc3, :string
    add_column :logs, :pc4, :string
    add_column :logs, :pc5, :string
    add_column :logs, :pc6, :string
  end
end
