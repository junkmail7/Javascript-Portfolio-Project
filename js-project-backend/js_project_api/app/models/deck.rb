class Deck < ApplicationRecord
    belongs_to :users, optional: true
    belongs_to :carts, optional: true
end
