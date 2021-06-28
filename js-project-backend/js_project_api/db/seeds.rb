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
sc = Deck.create!(name: "Santa Cruz Classic", brand: "Santa Cruz", price: 60.95, size: 8.25, user_id: 1, cart_id: 1, image: "https://res.cloudinary.com/dm1ikhi6x/image/upload/ar_1,c_pad/w_747,c_limit/q_auto:low,f_auto/products/xcrkppzw1zktb8qtxin0")
tradition = Deck.create!(name: "Onwards", brand: "Tradition", price: 52.13, size: 8, user_id: 1, cart_id: 1, image: "https://www.nativeskatestore.co.uk/images/onwards-skateboard-deck-8-0-p49789-121461_image.jpg")
frog = Deck.create!(name: "Frog Cow", brand: "frog", price: 60, size: 8.5, user_id: 1, cart_id: 1, image: "https://res.cloudinary.com/dm1ikhi6x/image/upload/ar_1,c_pad/w_747,c_limit/q_auto:low,f_auto/products/g64pwctffhjmlj52ypna")
dw = Deck.create!(name: "Deathspray Black", brand: "Deathwish", price: 59.99, size: 8, user_id: 1, cart_id: 1, image: "https://scene7.zumiez.com/is/image/zumiez/product_main_medium/Deathwish-Deathspray-Red-8.25%22-Skateboard-Deck-_323281-front-US.jpg")
one = Deck.create!(name: "Devil Worship", brand: "101", price: 74.95, size: 9.6, user_id: 1, cart_id: 1, image: "https://cdn.ccs.com/media/catalog/product/cache/4/image/550x550/17f82f742ffe127f42dca9de82fb58b1/8/0/805538558395-1.1542410619.jpg")
alien = Deck.create!(name: "Full Spectrum", brand: "Alien Workshop", price: 50, size: 8, user_id: 1, cart_id: 1, image: "https://scene7.zumiez.com/is/image/zumiez/product_main_medium/Alien-Workshop-Full-Spectrum-8.0%22-Skateboard-Deck-_328049-front-US.jpg")
nine = Deck.create!(name: "Ooolson", brand: "Call Me 917", price: 57, size: 8.5, user_id: 1, cart_id: 1, image: "https://res.cloudinary.com/dm1ikhi6x/image/upload/ar_1,c_pad/w_747,c_limit/q_auto:low,f_auto/products/agcwnov2wvyphleanfpt")
welcome = Deck.create!(name: "Moontrimmer", brand: "Welcome", price: 45.75, size: 8.5, user_id: 1, cart_id: 1, image: "https://scene7.zumiez.com/is/image/zumiez/product_main_medium/Welcome-Skateboards-Face-of-a-Lover-on-Moontrimmer-8.5%22-Skateboard-Deck-_272089-front.jpg")