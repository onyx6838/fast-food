/**
 * Api handler
 */
let ApiProducts = jqxhr('GET', 'products').then((result) => productsHandler(result.content));

let productsHandler = data => localStorage.setItem('prod', JSON.stringify([...data]));

let ApiCombos = jqxhr('GET', 'combos').then((result) => combosHandler(result));

let combosHandler = data => localStorage.setItem('comb', JSON.stringify([...data]));

/**
 * Setup cart localstr
 */
let cart = localStorage.getItem('cart') ? JSON.parse(localStorage.getItem('cart')) : [];

/**
 * UI handler
 */
const showCart = () => {
    loadCart(cart);
}

const popCart = () => {
    $('div.cart-btn span').text(cart.reduce((accu, item) => accu += item.qty, 0));
}


popCart();
/**
 * Cart handler
 */
const getIndex = id => cart.indexOf(cart.find(item => item.id === id));

const addToCart = (id, isCombo) => {
    successSwal().then(() => {
        if (cart.length > 0) {
            getIndex(id) > -1 ? cart[getIndex(id)].qty += 1 : cart.push({
                id,
                qty: 1,
                isCombo: isCombo
            });
        } else {
            cart.push({
                id,
                qty: 1,
                isCombo: isCombo
            });
        }
        localStorage.setItem('cart', JSON.stringify(cart));
        popCart();
    })
}

const updateCartItem = (id, stk) => {
    if (getIndex(id) > -1) {
        if (cart[getIndex(id)].qty == 1 && stk == -1) {
            deleteSwal().then((result) => {
                if (result.isConfirmed) {
                    cart.splice(getIndex(id), 1);
                }
            })
        } else {
            cart[getIndex(id)].qty += stk;
        }
    }
    localStorage.setItem('cart', JSON.stringify(cart));
    popCart();
    showCart();
}

const removeCartItem = id => {
    if (getIndex(id) > -1) {
        deleteSwal().then((result) => {
            if (result.isConfirmed) {
                cart.splice(getIndex(id), 1);
                localStorage.setItem('cart', JSON.stringify(cart));
                popCart();
                showCart();
            }
        })
    }
}

const resetCart = () => {
    deleteAllSwal().then((result) => {
        if (result.isConfirmed) {
            cart.splice(0, cart.length);
            localStorage.setItem('cart', cart);
            popCart();
            showCart();
        }
    })
}
/**
 * Checkout handler
 */
const redCheckout = () => {
    if (localStorage.getItem("ID") == null && localStorage.getItem("ID") == undefined) {
        ignoreSwal().then(() => window.open("sign-in.html"));
    }
}