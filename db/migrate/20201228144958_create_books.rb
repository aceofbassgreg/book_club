class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.string :link
      t.references :poll, foreign_key: true

      t.timestamps
    end
  end
end
