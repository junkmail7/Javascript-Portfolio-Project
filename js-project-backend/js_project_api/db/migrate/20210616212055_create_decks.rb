class CreateDecks < ActiveRecord::Migration[6.1]
  def change
    create_table :decks do |t|
      t.string :name
      t.string :brand
      t.decimal :price
      t.decimal :size
      t.integer :user_id

      t.timestamps
    end
  end
end
