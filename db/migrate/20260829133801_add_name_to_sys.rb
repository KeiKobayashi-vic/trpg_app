class AddNameToSys < ActiveRecord::Migration[8.1]
  def change
    add_column :sys, :name, :string
  end
end
