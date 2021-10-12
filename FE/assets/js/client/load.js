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
    getProduct();
    //navMenuClick();
});

function navMenuClick() {
    getProduct();
}

function detailProductClick(id) {
    getProductById(id);
}