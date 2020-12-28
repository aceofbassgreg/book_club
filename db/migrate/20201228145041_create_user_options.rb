class CreateUserOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :user_options do |t|
      t.foreign_key :user_id
      t.foreign_key :option_id
      t.integer :score

      t.timestamps
    end
  end
end
