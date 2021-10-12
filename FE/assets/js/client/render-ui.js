/**
 * Render UI Product for Main page
 */
function loadProduct(data) {
    $('.menu-list-tab .row').empty();
    var pers;
    data.forEach((item, index) => {
        pers =
            '<div class="col-lg-3 col-md-6">' +
            '<div class="single-product">' +
            '<div class="product-image">' +
            '<a href="product-details.html" onclick="detailProductClick(' + item.id + ')">' +
            '<img src="assets/img/shop/image1.jpg" alt="image">' +
            '</a>' +
            '<a href="cart.html" class="add-to-cart-btn">Add To Cart' +
            '<i class="flaticon-shopping-cart"></i>' +
            '</a>' +
            '</div>' +
            '<div class="product-content">' +
            '<h3>' +
            '<a href="product-details.html">' +
            item.name +
            '</a>' +
            '</h3>' +
            '<div class="price">' +
            '<span class="new">$' + item.price + '</span>' +
            // '<span class="old">$' + item.id + '</span>' +
            '</div>' +
            '<div class="rating">' +
            '<i class="bx bxs-star"></i>' +
            '<i class="bx bxs-star"></i>' +
            '<i class="bx bxs-star"></i>' +
            '<i class="bx bxs-star"></i>' +
            '<i class="bx bxs-star"></i>' +
            '</div>' +
            '</div>' +
            '</div>' + '</div>';
        $('.menu-list-tab .row').append(pers);
    });
}
/**
 * Render UI Product by Id for Detail Page
 */
function loadProductById(data) {
    $('.price').empty();
    $('.price').append(
        '<h3>' + data.name + '</h3>' + 
        '<span class="new-price">$' + item.price + '</span>' +
        '<p>' + item.description + '</p>'
    )
}
/**
 * Render UI New Product for Main page
 */
function loadNewProduct(data) {
    $('.pizza-shop-area .row').empty();
    var pers;
    data.forEach((item, index) => {
        pers = '<div class="col-lg-3 col-md-6">' +
            '<div class="pizza-shop-item">' +
            '<div class="image">' +
            '<img src="assets/img/pizza-shop/4.png" alt="image">' +
            '<div class="pizza-btn">' +
            '<a href="shop.html" class="default-btn">Order Online' +
            '<i class="flaticon-play-button"></i>' +
            '<span></span>' +
            '</a>' +
            '</div>' +
            '</div>' +
            '<div class="content">' +
            '<h3>' + item.name + '</h3>' +
            '<p>Learning do amet contur dicivt suia non nuameius velit</p>' +
            '<span>$' + item.price + '</span>' +
            '</div>' +
            '</div>' +
            '</div>';
        $('.pizza-shop-area .row').append(pers);
    });
}
/**
 * Render UI Combo for Main page
 */
function loadCombo(data) {
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
function loadCategory(data) {
    var pers = '';
    data.forEach((item, _) => {
        pers +=
            '<li>' +
            '<a href="#">' +
            '<i class="' + item.image + '"></i>' +
            '<span>' + item.name + '</span>' +
            '</a>' +
            '</li>';
    });
    $("#category-list ul").append(pers);
    categoryEffect();
}