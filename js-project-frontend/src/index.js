const BASE_URL = "http://localhost:3000"
const DECKS_URL = `${BASE_URL}/decks`
const USERS_URL = `${BASE_URL}/users`
const CARTS_URL = `${BASE_URL}/carts`

const main = document.getElementsByTagName("main")[0];
const header = document.getElementsByTagName("header")[0];
const signup = document.querySelector(".signup")
const input = document.querySelector(".input")
const cartDiv = document.querySelector(".cart")
const cartButton = document.querySelector(".viewCart")
const checkoutButton = document.querySelector(".checkout")

//Render + SignUp + Login for User

signup.addEventListener('submit', function(e){
    e.preventDefault()
    fetch(USERS_URL, {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
            Accept: "application/json"
        },
        body: JSON.stringify({
            name: input.value
        })
    })
    .then(res => res.json())
    .then(function(json){
        renderUser(json)
        }
    )
})

class loggedInUser {
    constructor(username, id){
    this.username = username
    this.id = id
    }
    get the_username(){
        return this.username;
    }
    get the_id(){
        return this.id;
    }
}

const loggedin = new loggedInUser("")

function renderUser(jsonObj) {
    u = jsonObj
    loggedin.username = u.name
    loggedin.id = u.id
    signup.style.display = 'none'

    const userDiv = document.createElement("div");
    userDiv.id = u.id;
    header.appendChild(userDiv);
    const userP = document.createElement("p");
    userP.innerHTML = "Current User: " + u.name;
    userDiv.appendChild(userP);
    header.appendChild(userDiv);

    const logoutButton = document.createElement("button");
    logoutButton.innerHTML = "Logout";
    logoutButton.addEventListener("click", function (e) {
        signup.style.display = ''
        userP.style.display = 'none'
        logoutButton.style.display = 'none'
        loggedin.username = ""
        loggedin.id = ""
        clearCartVisuals()
    });
    userDiv.className = "user"
    createUsersCart(u.id)
    userDiv.appendChild(logoutButton)
    header.append(userDiv)
}

//Render Decks

document.addEventListener("DOMContentLoaded", () => {
    fetch(DECKS_URL)
    .then(response => response.json())
    .then(json => renderDecks(json))
});

function renderDecks(jsonObj) {
    for (const d of jsonObj) {
        const deckDiv = document.createElement("div");
        deckDiv.id = d.id;

        const deckimage = document.createElement("img");
        deckimage.src = d.image;
        deckimage.style = "max-height: 200px; max-width: 200px;"
        deckDiv.appendChild(deckimage);

        const deckP = document.createElement("p");
        deckP.innerHTML = "Name: " + d.name;
        deckDiv.appendChild(deckP);

        const deckbrandP = document.createElement("p");
        deckbrandP.innerHTML = "Brand: " +  d.brand;
        deckDiv.appendChild(deckbrandP);

        const decksizeP = document.createElement("p");
        decksizeP.innerHTML = "Size: " +  d.size;
        deckDiv.appendChild(decksizeP);
        
        const deckpriceP = document.createElement("p");
        deckpriceP.innerHTML = "Price: $" +  d.price;
        deckDiv.appendChild(deckpriceP);

        const addDecktoCartButton = document.createElement("button");
        addDecktoCartButton.innerHTML = "Add to Cart";
        addDecktoCartButton.addEventListener("click", function (e) {
            addToCart(d)
        });
        deckDiv.appendChild(addDecktoCartButton);

        main.appendChild(deckDiv);
    }
}

//Add Deck to Cart

function createUsersCart(u_id)
{
    fetch(CARTS_URL, {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
            Accept: "application/json"
        },
        body: JSON.stringify({
            user_id: u_id
        })
    })
}

function addToCart(d)
{
    fetch((DECKS_URL + "/" + d.id), {
        method: "PATCH",
        headers: {
            "Content-Type": "application/json",
            Accept: "application/json"
        },
        body: JSON.stringify({
            cart_id: loggedin.id
        })
    })
}
    
let clicked = false
checkoutButton.style.display = 'none'

cartButton.addEventListener("click", function (e) {
    clicked = !clicked
    if (clicked == true){
        cartDiv.style.display = ''
        checkoutButton.style.display = ''
        fetch((CARTS_URL + "/" + loggedin.id))
        .then(response => response.json())
        .then(json => viewCartItems(json))
    }
    else if (clicked == false) {
        clearCartVisuals()
    }
});

function clearCartVisuals(){
    cartDiv.style.display = 'none'
    checkoutButton.style.display = 'none'
    while (cartDiv.firstChild) {
        cartDiv.removeChild(cartDiv.firstChild);
    }
}

let x = 0

function viewCartItems(cartItems)
{
    for (const i of cartItems)
    {
    const cartItemDiv = document.createElement("div");
    const cartItemNameP = document.createElement("p");
    cartItemNameP.innerHTML = i.name;
    cartItemDiv.appendChild(cartItemNameP);
    const cartItemPriceP = document.createElement("p");
    cartItemPriceP.innerHTML = "$" + i.price;
    cartItemDiv.appendChild(cartItemPriceP);
    const removeButton = document.createElement("button");
    removeButton.innerHTML = "Remove";
    removeButton.addEventListener("click", function (e) {
        fetch((DECKS_URL + "/" + i.id), {
            method: "PATCH",
            headers: {
                "Content-Type": "application/json",
                Accept: "application/json"
            },
            body: JSON.stringify({
                cart_id: ''
            })
        })
    });
    cartItemDiv.appendChild(removeButton);
    cartDiv.appendChild(cartItemDiv);

    let realnum = parseFloat(i.price)
    x = x + realnum
    }
    const total = document.createElement("p");
    total.innerHTML = "Total :$" + x;
    cartDiv.appendChild(total);
}

checkoutButton.addEventListener("click", function (e) {
    //delete all decks within the cart
});


