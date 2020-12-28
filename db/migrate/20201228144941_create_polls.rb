class CreatePolls < ActiveRecord::Migration[6.1]
  def change
    create_table :polls do |t|
      t.string :name, null: false

      t.timestamps
    end

    add_index :polls, :name, unique: true
  end
end
