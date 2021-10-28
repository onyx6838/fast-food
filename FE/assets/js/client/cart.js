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
    Swal.fire({
        position: 'top-end',
        icon: 'success',
        title: 'Đã thêm vào giỏ hàng',
        showConfirmButton: false,
        timer: 1000
    }).then(() => {
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

const updateCartItem = (id, stk) => {
    console.log(getIndex(id));

    if (getIndex(id) > -1) {
        if (cart[getIndex(id)].qty == 1 && stk == -1) {
            Swal.fire({
                title: 'Xóa sản phẩm này trong giỏ hàng?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Xác nhận',
                cancelButtonText: 'Hủy'
            }).then((result) => {
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
    getIndex(id) > -1 ? cart.splice(getIndex(id), 1) : '';
    localStorage.setItem('cart', JSON.stringify(cart));
    popCart();
    showCart();
}

const resetCart = () => {
    Swal.fire({
        title: 'Xóa tất cả sản phẩm trong giỏ hàng?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Xác nhận',
        cancelButtonText: 'Hủy'
    }).then((result) => {
        if (result.isConfirmed) {
            cart.splice(0, cart.length);
            localStorage.setItem('cart', cart);
            popCart();
            showCart();
        }
    })
}