/**
 * Render UI Product Or Combo for Menu page
 */
let loadProduct = (data, typeUI) => {
    $('.menu-list-tab .row').empty();
    var pers;
    data.forEach((item, index) => {
        let price = !typeUI ? item.price : item.totalPrice;
        let click = !typeUI ? `detailProductClick(${item.id})` : `detailComboClick(${item.id})`;
        pers = `
        <div class="col-lg-3 col-md-6">
            <div class="single-product">
                <div class="product-image">
                    <a onclick="${click}">
                        <img src="assets/img/shop/image1.jpg" alt="image">
                    </a>
                    <a class="add-to-cart-btn" onclick="addToCart(${item.id})">Add To Cart
                        <i class="flaticon-shopping-cart"></i>
                    </a>
                </div>
                <div class="product-content">
                    <h3><a>${item.name}</a></h3>
                    <div class="price">
                        <span class="new">$${price}</span>
                    </div>
                </div>
            </div>
        </div>
        `;
        $(pers).appendTo($('.menu-list-tab .row'));
    });
}
/**
 * Render UI Product by Id for Detail Page
 */
let loadProductById = (data) => {
    $('.price').empty();
    $('.price').append(`
        <h3>${data.name}</h3>
            <span class="new-price">$${data.price}</span>
        <p>${data.description}</p>`)
}
/**
 * Render UI New Product for main page
 */
let loadNewProduct = (data) => {
    $('.pizza-shop-area .row').empty();

    var pers;
    data.forEach((item, index) => {
        pers =
            `
        <div class="col-lg-3 col-md-6">
            <div class="pizza-shop-item">
                <div class="image">
                    <img src="assets/img/pizza-shop/4.png" alt="image">
                    <div class="pizza-btn">
                        <a href="shop.html" class="default-btn">Order Online
                            <i class="flaticon-play-button"></i>
                            <span></span>
                        </a>
                    </div>
                </div>
                <div class="content">
                    <h3>${item.name}</h3>
                    <p>Learning do amet contur dicivt suia non nuameius velit</p>
                    <span>$${item.price}</span>
                </div>
            </div>
        </div>
        `;
        $('.pizza-shop-area .row').append(pers);
    });
}
/**
 * Render UI Combo for Main page
 */
let loadCombo = (data) => {
    $('.burger-shop-slider').empty();
    var pers = '';

    data.forEach((item, _) => {
        pers +=
            '<div class="burger-shop-item">' +
            '<div class="image">' +
            '<img src="assets/img/burger-shop/4.png" alt="image">' +
            '<div class="burger-btn">' +
            '<a href="shop.html" class="default-btn">Order Online' +
            '<i class="flaticon-play-button"></i>' +
            '<span></span>' +
            '</a>' +
            '</div>' +
            '</div>' +
            '<div class="content">' +
            '<h3>' + item.name + '</h3>' +
            '<p>' + item.description + '</p>' +
            '<span>$' + item.totalPrice + '</span>' +
            '</div>' +
            '</div>';
    });
    $('.burger-shop-slider').append(pers);
    comboEffect();
}
/**
 * Render UI Category for Menu page
 */
let loadCategory = (data) => {
    var pers = '';
    data.forEach((item, index) => {
        pers +=
            '<li>' +
            '<a onclick="getProductByCategory(' + (index + 1) + ')">' +
            '<i class="' + item.image + '"></i>' +
            '<span>' + item.name + '</span>' +
            '</a>' +
            '</li>';
    });
    // combo load
    pers +=
        '<li>' +
        '<a onclick=getComboMenuPage()>' +
        '<i class="flaticon-hamburger"></i>' +
        '<span>' + "Combo" + '</span>' +
        '</a>' +
        '</li>';

    $("#category-list ul").append(pers);
    categoryEffect();
}

/**
 * Render UI Product in Cart for Cart page
 */
let loadCart = (cartInfo) => {
    $('.cart-table tbody').empty();
    $('.cart-totals b').empty();
    let products = JSON.parse(localStorage.getItem('prod'));
    console.log(products);
    console.log(cartInfo);
    if (cartInfo.length > 0) {
        cartInfo.forEach((item, _) => {
            $('.cart-table tbody').append(
                `
                <tr>
                    <td class="product-thumbnail">
                        <a href="#">
                            <img src="assets/img/shop/image1.jpg" alt="item">
                        </a>
                    </td>
                    <td class="product-name">
                        <a href="#">${products[item.id - 1].name}</a>
                    </td>
                    <td class="product-price">
                        <span class="unit-amount">$${products[item.id - 1].price}</span>
                    </td>
                    <td class="product-quantity">
                        <div class="input-counter">
                            <span class="minus-btn">
                                <i class='bx bx-minus' onclick="updateCartItem(${item.id}, -1)"></i>
                            </span>
                            <input type="text" value="${item.qty}">
                            <span class="plus-btn">
                                <i class='bx bx-plus' onclick="updateCartItem(${item.id}, 1)"></i>
                            </span>
                        </div>
                    </td>
                    <td class="product-subtotal">
                        <span class="subtotal-amount">$${products[item.id - 1].price * item.qty}</span>
                        <a class="remove" onclick="removeCartItem(${item.id})">
                            <i class='bx bx-trash'></i>
                        </a>
                    </td>
                </tr>
                `
            );
        })
        $('.cart-totals b').append(`${(cart.reduce((accu, item, i) => accu += item.qty * products[item.id-1].price, 0)).toLocaleString('en-US', {minimumFractionDigits: 2, maximumFractionDigits: 2})}`);
    } else {
        Swal.fire(
            'Chưa có sản phẩm trong giỏ'
        )
        $('.cart-totals b').append('0');
    }
}