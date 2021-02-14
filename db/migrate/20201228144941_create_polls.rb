class CreatePolls < ActiveRecord::Migration[6.1]
  def change
    create_table :polls do |t|
      t.integer :event_id, foreign_key: true, null: false
      t.datetime :active_starting_at, null: false
      t.datetime :active_ending_at, null: false
      t.timestamps
    end
  end
end
