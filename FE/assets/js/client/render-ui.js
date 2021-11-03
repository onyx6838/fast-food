/**
 * Render UI Product Or Combo for Menu page
 */
let loadProduct = (data, typeUI) => {
    $('.menu-list-tab .row').empty();
    var pers;
    data.forEach((item, index) => {
        let price = !typeUI ? item.price : item.totalPrice;
        let isCombo = !typeUI ? false : true;
        let click = !typeUI ? `detailProductClick(${item.id} , ${isCombo})` : `detailComboClick(${item.id} , ${isCombo})`;
        pers = `
        <div class="col-lg-3 col-md-6">
            <div class="single-product">
                <div class="product-image">
                    <a onclick="${click}">
                        <img src="assets/img/shop/image1.jpg" alt="image">
                    </a>
                    <a class="add-to-cart-btn" onclick="addToCart(${item.id} , ${isCombo})">Add To Cart
                        <i class="flaticon-shopping-cart"></i>
                    </a>
                </div>
                <div class="product-content">
                    <h3><a>${item.name}</a></h3>
                    <div class="price">
                        <span class="new">${price}<u>đ</u></span>
                    </div>
                </div>
            </div>
        </div>
        `;
        $(pers).appendTo($('.menu-list-tab .row'));
    });
}
/**
 * Render UI Product or Combo Detail by Id for Detail Page
 */
let loadDetailById = () => {
    if (typeof (Storage) !== "undefined") {
        let data = JSON.parse(localStorage.getItem("product-detail"));
        let cart = localStorage.getItem('cart') ? JSON.parse(localStorage.getItem('cart')) : [];
        let quantity = cart.length > 0 ? (
            cart.find(item => item.isCombo === data.isCombo && item.id === data.id) === undefined ? 0 :
            cart.find(item => item.isCombo === data.isCombo && item.id === data.id).qty
        ) : 0;

        $('.price-detail').empty();
        $('.price-detail').append(`
            <h3>${data.name}</h3>
            <span class="new-price">${data.isCombo ? data.totalPrice : data.price}<u>đ</u></span>
            <span id="desc-detail"></span>`)

        $('#desc-detail').html(data.description)

        $('.product-add-to-cart').empty();
        $('.product-add-to-cart').append(
            `
            <div class="input-counter">
                <span class="minus-btn">
                <i class='bx bx-minus' onclick="updateCartItem(${data.id}, -1)"></i>
                </span>
                <input type="text" value="${quantity}">
                <span class="plus-btn">
                    <i class='bx bx-plus' onclick="updateCartItem(${data.id}, 1)"></i>
                </span>
            </div>
            <button type="submit" class="default-btn" onclick="addToCart(${data.id} , ${data.isCombo})">
                Thêm vào giỏ
                <span></span>
            </button>
            `
        );
    } else {
        alert("Browser does not support Web Storage.");
    }
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
                        <a href="menu.html" class="default-btn">Xem ngay
                            <i class="flaticon-play-button"></i>
                            <span></span>
                        </a>
                    </div>
                </div>
                <div class="content">
                    <h3>${item.name}</h3>
                    <p>${item.name}</p>
                    <span>${item.price}<u>đ</u></span>
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
            '<a href="menu.html" class="default-btn">Xem ngay' +
            '<i class="flaticon-play-button"></i>' +
            '<span></span>' +
            '</a>' +
            '</div>' +
            '</div>' +
            '<div class="content">' +
            '<h3>' + item.name + '</h3>' +
            '<p>' + item.description + '</p>' +
            '<span>' + item.totalPrice + '<u>đ</u></span>' +
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
    let combos = JSON.parse(localStorage.getItem('comb'));

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
                        <a href="#">${item.isCombo ? combos[item.id - 1].name : products[item.id - 1].name}</a>
                    </td>
                    <td class="product-price">
                        <span class="unit-amount">${item.isCombo ? combos[item.id - 1].totalPrice : products[item.id - 1].price}<u>đ</u></span>
                    </td>
                    <td class="product-quantity">
                        <div class="input-counter">
                            <span class="minus-btn">
                                <i class='bx bx-minus' onclick="updateCartItem(${item.id}, -1, ${item.isCombo})"></i>
                            </span>
                            <input type="text" value="${item.qty}">
                            <span class="plus-btn">
                                <i class='bx bx-plus' onclick="updateCartItem(${item.id}, 1, ${item.isCombo})"></i>
                            </span>
                        </div>
                    </td>
                    <td class="product-subtotal">
                        <span class="subtotal-amount">${(item.isCombo ?  combos[item.id - 1].totalPrice : products[item.id - 1].price) * item.qty}<u>đ</u></span>
                        <a class="remove">
                            <i class='bx bx-trash' onclick="removeCartItem(${item.id}, ${item.isCombo})"></i>
                        </a>
                    </td>
                </tr>
                `
            );
        })
        $('.cart-totals b').append(`${(cart.reduce((accu, item, i) => accu += item.qty * 
            (item.isCombo ? combos[item.id - 1].totalPrice : products[item.id - 1].price), 0)).toLocaleString('en-US')}<u>đ</u>`);
    } else {
        Swal.fire(
            'Chưa có sản phẩm trong giỏ'
        )
        $('.cart-totals b').append('0<u>đ</u>');
    }
}

/**
 * Render UI Cart for Checkout Page
 */
const loadCartCheckout = (cartInfo) => {
    $('.order-details tbody').empty();
    let products = JSON.parse(localStorage.getItem('prod'));
    let combos = JSON.parse(localStorage.getItem('comb'));
    cartInfo.forEach((item, _) => {
        $('.order-details tbody').append(
            `
            <tr>
                <td class="product-name">
                    <a>${item.isCombo ? combos[item.id - 1].name : products[item.id - 1].name}</a>
                </td>
                <td class="product-total">
                    <span class="subtotal-amount">$${ (item.isCombo ?  combos[item.id - 1].totalPrice : products[item.id - 1].price) * item.qty}</span>
                </td>
            </tr>
            `
        );
    });
    $('.order-details tbody').append(
        `
        <tr>
            <td class="product-name">
                <a>Tổng cộng</a>
            </td>
            <td class="product-total">
                <span class="subtotal-amount">$${(cart.reduce((accu, item, i) => accu += item.qty * 
                    (item.isCombo ? combos[item.id - 1].totalPrice : products[item.id - 1].price), 0)).toLocaleString('en-US')}</span>
            </td>
        </tr>
        `
    );
}

/**
 * Render UI Order Info for Checkout Page
 */
const loadCheckoutOrder = () => {
    $('#ip-fullName').val(storage.getItem('FULL_NAME'));
    $('#ip-email').val(storage.getItem('EMAIL'));
    $('#ip-phone').val(storage.getItem('PHONE'));
    getDistrictFromXML();
}

/**
 * Render UI for District SelectBox from XML for checkout page
 */
const loadDistrictFromXML = (data) => {
    $('#ip-checkbox-district').empty();
    $('#ip-checkbox-district').append('<option value="">--Chọn Tỉnh Thành--</option>')
    data.forEach(item => {
        $('#ip-checkbox-district').append(`<option value="${item.id}">${item.name}</option>`)
    })
}

const loadWardFromXML = (data) => {
    $('#ip-checkbox-ward').empty();
    $('#ip-checkbox-ward').append('<option value="">--Chọn Quận Huyện--</option>')
    data.forEach(item => {
        $('#ip-checkbox-ward').append(`<option value="${item.id}">${item.name}</option>`)
    })
}