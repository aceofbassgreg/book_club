class CreateOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :options do |t|
      t.string :name
      t.string :author
      t.string :link
      t.foreign_key :poll_id

      t.timestamps
    end
  end
end
