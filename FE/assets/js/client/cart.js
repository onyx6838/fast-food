let ApiProducts = jqxhr('GET', 'products').then((result) => productsHandler(result.content));

let products;

let productsHandler = (data) => {
    products = [...data];
    localStorage.setItem('prod', JSON.stringify(products));
};

let cart = localStorage.getItem('cart') ? JSON.parse(localStorage.getItem('cart')) : [];

const getIndex = id => cart.indexOf(cart.find(item => item.id === id));

const showCart = () => {
    loadCart(cart);
}

const popCart = () => {
    $('div.cart-btn span').text(cart.reduce((accu, item) => accu += item.qty, 0));
}

popCart();

const addToCart = id => {
    Swal.fire(
        'Đã thêm vào giỏ hàng'
    ).then(() => {
        if (cart.length > 0) {
            getIndex(id) > -1 ? cart[getIndex(id)].qty += 1 : cart.push({
                id,
                qty: 1
            });
        } else {
            cart.push({
                id,
                qty: 1
            });
        }
        localStorage.setItem('cart', JSON.stringify(cart));
        popCart();
    })
}