class CreateInvites < ActiveRecord::Migration[6.1]
  def change
    create_table :invites do |t|
      t.string :first_name, null: false
      t.string :email, null: false

      t.timestamps
    end
  end
end
