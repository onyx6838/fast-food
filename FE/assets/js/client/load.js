$(function () {
    //$(".home-slider").load("/assets/components/main-slider.html");
    $("#navbar").load("/assets/components/navbar.html");
    $("#footer").load("/assets/components/footer.html");
    $(".page-title-area").load("/assets/components/slider-nd-page.html");
    $("#category-list").load("/assets/components/category.html");
    getFood();
    //navMenuClick();
});

function navMenuClick() {
    getFood();
    // $("#main-menu").load("/assets/components/main-menu.html", () => {
    //     getFood();
    // });
}