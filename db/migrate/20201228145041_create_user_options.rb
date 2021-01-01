class CreateUserOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :user_options do |t|
      t.references :user, foreign_key: true, null: false
      t.references :option, foreign_key: true, null: false
      t.integer :score

      t.timestamps
    end
  end
end
