class AddActiveStartingAtAndActiveEndingAtToPolls < ActiveRecord::Migration[6.1]
  def change
    add_column :polls, :active_starting_at, :datetime, null: false
    add_column :polls, :active_ending_at, :datetime, null: false
  end
end
