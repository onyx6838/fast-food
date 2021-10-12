$(function () {
    $(".home-slider").load("/assets/components/main-slider.html", () => {
        sliderEffect();
    });
    $("#navbar").load("/assets/components/navbar.html");
    $("#footer").load("/assets/components/footer.html");
    $(".page-title-area").load("/assets/components/slider-nd-page.html");
    getProduct();
    getNewProduct();
    getCombo();
    getCategory();
    //navMenuClick();
});

function navMenuClick() {
    getProduct();
    // $("#main-menu").load("/assets/components/main-menu.html", () => {
    //     getFood();
    // });
}