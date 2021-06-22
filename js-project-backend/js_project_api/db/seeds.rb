# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
testU = User.create(name: 'a')
testC = Cart.create(user_id: 1)
blind = Deck.create!(name: "Blind Reaper", brand: "Blind", price: 54.95, size: 8.25, user_id: 1, cart_id: 1, image: "https://m.media-amazon.com/images/I/71gjY2InN5L._AC_SL1500_.jpg")
baker = Deck.create!(name: "Baker Classic", brand: "Baker", price: 50.25, size: 8.15, user_id: 1, cart_id: 1, image: "https://img.skatewarehouse.com/cache/270/BKBL85DK-1.jpg")
welcome = Deck.create!(name: "Moontrimmer", brand: "Welcome", price: 45.75, size: 8.5, user_id: 1, cart_id: 1, image: "https://scene7.zumiez.com/is/image/zumiez/product_main_medium/Welcome-Skateboards-Face-of-a-Lover-on-Moontrimmer-8.5%22-Skateboard-Deck-_272089-front.jpg")