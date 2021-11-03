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
const getIndex = (id, isCombo) => cart.indexOf(cart.find(item => item.id === id && item.isCombo === isCombo));

const addToCart = (id, isCombo) => {
    successSwal().then(() => {
        if (cart.length > 0) {
            getIndex(id, isCombo) > -1 ? cart[getIndex(id, isCombo)].qty += 1 : cart.push({
                id: id,
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

const updateCartItem = (id, stk, isCombo) => {
    if (getIndex(id, isCombo) > -1) {
        if (cart[getIndex(id, isCombo)].qty == 1 && stk == -1) {
            deleteSwal().then((result) => {
                if (result.isConfirmed) {
                    cart.splice(getIndex(id, isCombo), 1);
                }
            })
        } else {
            //cart.find(item => item.id === getIndex(id) && item.isCombo === isCombo).qty += stk;
            cart[getIndex(id, isCombo)].qty += stk
        }
    }
    localStorage.setItem('cart', JSON.stringify(cart));
    popCart();
    showCart();
    getDetailProduct();
}

const removeCartItem = (id, isCombo) => {
    if (getIndex(id, isCombo) > -1) {
        deleteSwal().then((result) => {
            if (result.isConfirmed) {
                cart.splice(getIndex(id, isCombo), 1);
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
    } else {
        window.open("checkout.html")
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
        let district = $('#ip-checkbox-district').children(":selected").text();
        let ward = $('#ip-checkbox-ward').children(":selected").text();

        let notes = $('#ip-notes').val();
        let contact = $('#ip-phone').val();

        let products = JSON.parse(localStorage.getItem('prod'));
        let combos = JSON.parse(localStorage.getItem('comb'));

        let orderRequest = {
            order: {
                customerId: storage.getItem('ID'),
                name: storage.getItem('FULL_NAME'),
                address: address,
                contact: contact,
                district: district,
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
        }).done(() => successCheckoutSwal()).then(() => setInterval(() => window.location.replace("index.html"), 3000)).fail(() => ignoreCheckoutSwal());
    }
}