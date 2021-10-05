function getFood() {
    //var url = "https://6123b178124d8800175683d7.mockapi.io/foods";
    var url = "http://localhost:8080/api/v1/products";
    $.ajax({
        url: url,
        type: 'GET',
        contentType: "application/json",
        dataType: 'json'
    }).done(function (data) {
        loadUI(data.content);
    }).fail(function (jqXHR, textStatus, errorThrown) {
        console.log(textStatus + ': ' + errorThrown);
    });
}

function loadUI(data) {
    $('.menu-list-tab .row').empty();
    var pers;
    data.forEach((item, index) => {
        pers =
            '<div class="col-lg-3 col-md-6">' +
            '<div class="single-product">' +
            '<div class="product-image">' +
            '<a href="product-details.html">' +
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


    console.log(data);
}