class CreateUserOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :user_options do |t|
      t.references :user, foreign_key: true
      t.references :option, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
