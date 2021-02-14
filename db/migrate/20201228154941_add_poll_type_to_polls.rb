class AddPollTypeToPolls < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      CREATE TYPE poll_type AS ENUM ('book', 'date');
    SQL
    add_column :polls, :poll_type, :poll_type, null: false
    add_index :polls, :poll_type
  end

  def down
    remove_column :polls, :poll_type
    execute <<-SQL
      DROP TYPE poll_type;
    SQL
  end
end
