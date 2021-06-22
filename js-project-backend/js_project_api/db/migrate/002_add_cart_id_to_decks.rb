class AddCartIdToDecks < ActiveRecord::Migration[6.0]
    def change
      add_column :decks, :cart_id, :integer
    end
end