class CreateSys < ActiveRecord::Migration[8.1]
  def change
    create_table :sys do |t|
      t.string :name
      t.timestamps
    end
  end
end
