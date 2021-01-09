class CreateUserBookVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :user_book_votes do |t|
      t.references :user, foreign_key: true, null: false
      t.references :book, foreign_key: true, null: false
      t.integer :score, null: false

      t.timestamps
    end
  end
end
