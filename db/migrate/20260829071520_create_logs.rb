class CreateLogs < ActiveRecord::Migration[8.1]
  def change
    create_table :logs do |t|
      t.string :system
      t.date :date
      t.integer :gm
      t.integer :pl1
      t.integer :pl2
      t.integer :pl3
      t.integer :pl4
      t.integer :pl5
      t.integer :pl6
      t.text :other
      t.timestamps
    end
  end
end
