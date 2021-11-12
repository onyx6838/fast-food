$(() => {
    //Load slider
    $(".home-slider").load("./assets/components/main-slider.html", () => {
        sliderEffect();
    });
    $("#navbar").load("./assets/components/navbar.html", () => {
        if (storage.getItem("ID") != null && storage.getItem("ID") != undefined) {
            $('#login-box').addClass('nav-item');
            $('#login-box a').first().text(storage.getItem("FULL_NAME").split(' ').slice(-1).join(' '));
        }
        popCart();
    });
    $("#footer").load("./assets/components/footer.html");

    getNewProduct();
    getCombo();
    getCategory();
    //getProductByCategory(1);
    getProductByCategoryV1(1);
    //navMenuClick();
    getDetailProduct();
});

let loadHeader = () => $(".page-title-area").load("./assets/components/slider-nd-page.html", () => {
    changeTitleHeader()
});

let navMenuClick = () => getProductByCategoryV1(1);

let detailProductClick = (id, isCombo) => getProductById(id, isCombo);

let detailComboClick = (id, isCombo) => getComboById(id, isCombo);

let getDetailProduct = () => {
    loadDetailById();
}

let logout = () => {
    storage.removeItem("ID");
    storage.removeItem("FULL_NAME");
    storage.removeItem("USERNAME");
    storage.removeItem("ROLE");
    storage.removeItem("TOKEN");
    storage.removeItem("PHONE");
    storage.removeItem("EMAIL");
    window.location.replace("sign-in.html");
}