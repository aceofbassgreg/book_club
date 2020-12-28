class CreateOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :options do |t|
      t.string :name
      t.string :author
      t.string :link
      t.references :poll, foreign_key: true

      t.timestamps
    end
  end
end
