class AddImageToDecks < ActiveRecord::Migration[6.0]
    def change
      add_column :decks, :image, :string
    end
end