$(function () {
    $(".home-slider").load("/assets/components/main-slider.html", () => {
        sliderEffect();
    });
    $("#navbar").load("/assets/components/navbar.html");
    $("#footer").load("/assets/components/footer.html");
    $(".page-title-area").load("/assets/components/slider-nd-page.html");
    getNewProduct();
    getCombo();
    getCategory();
    getProductByCategory(1);
    //navMenuClick();
    getDetailProduct();
});

let navMenuClick = () => getProductByCategory(1);

let detailProductClick = (id) => getProductById(id);

let detailComboClick = (id) => getComboById(id);

let getDetailProduct = () => {
    if (typeof (Storage) !== "undefined") {
        var data = JSON.parse(localStorage.getItem("product-detail"));
        $('.price').empty();
        $('.price').append(`
            <h3>${data.name}</h3>
                <span class="new-price">$${data.price}</span>
            <p>${data.description}</p>`)
    } else {
        alert("Browser does not support Web Storage.");
    }
}