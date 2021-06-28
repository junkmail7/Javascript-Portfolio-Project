class Cart < ApplicationRecord
    belongs_to :user
    has_many :decks

    def total 
        amount = 0
        self.decks.each do |d|
            amount = amount+ d.price
        end 
        return amount
    end
end
