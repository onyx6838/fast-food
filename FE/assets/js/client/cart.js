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
        getDetailProduct();
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
    getDetailProduct();
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
    if (storage.getItem("ID") == null && storage.getItem("ID") == undefined) {
        ignoreSwal().then(() => {
            window.open("sign-in.html")
            return;
        });
    }
}

const showCheckoutCart = () => {
    loadCartCheckout(cart);
}

const showCheckoutOrder = () => {
    loadCheckoutOrder();
}

const checkOut = () => {
    if (storage.getItem("ID") == null && storage.getItem("ID") == undefined) {
        ignoreSwal().then(() => {
            window.open("sign-in.html")
            return;
        });
    } else {
        let address = $('#ip-address').val();
        let province = $('#ip-province').val();
        let ward = $('#ip-ward').val();
        let notes = $('#ip-notes').val();
    
        let products = JSON.parse(localStorage.getItem('prod'));
        let combos = JSON.parse(localStorage.getItem('comb'));
    
        let orderRequest = {
            order: {
                customerId: storage.getItem('ID'),
                name: storage.getItem('FULL_NAME'),
                address: address,
                province: province,
                ward: ward,
                note: notes,
                username: storage.getItem('USERNAME'),
                totalPrice: cart.reduce((accu, item, i) => accu += item.qty * (item.isCombo ? combos[item.id - 1].totalPrice : products[item.id - 1].price), 0)
            },
            cart: cart
        }
    
        $.ajax({
            url: 'http://localhost:8080/api/v1/cart',
            type: 'POST',
            data: JSON.stringify(orderRequest),
            contentType: "application/json",
            beforeSend: function (xhr) {
                xhr.setRequestHeader("Authorization", "Bearer " + storage.getItem("TOKEN"));
            }
        }).done(() => successCheckoutSwal()).fail(() => ignoreCheckoutSwal());
    }
}