$(() => {
    //Load slider
    $(".home-slider").load("./assets/components/main-slider.html", () => {
        sliderEffect();
    });
    //load navbar
    $("#navbar").load("./assets/components/navbar.html", () => {
        if (storage.getItem("ID") != null && storage.getItem("ID") != undefined) {
            $('#login-box').addClass('nav-item');
            $('#login-box a').first().text(storage.getItem("FULL_NAME").split(' ').slice(-1).join(' '));
        }
        popCart();
    });
    $("#footer").load("./assets/components/footer.html");
    //get list new product
    getNewProduct();
    //get product combo
    getCombo();
    //get category
    getCategory();
    //get list product by category
    //getProductByCategory(1);
    getProductByCategoryV1(1);
    //get product details
    //navMenuClick();
    getDetailProduct();
});
//Load header page
let loadHeader = () => $(".page-title-area").load("./assets/components/slider-nd-page.html", () => {
    changeTitleHeader()
});
//click item navbar to get product by category
let navMenuClick = () => getProductByCategoryV1(1);
// click product to get product detail
let detailProductClick = (id, isCombo) => getProductById(id, isCombo);
// click product combo to get product combo detail
let detailComboClick = (id, isCombo) => getComboById(id, isCombo);
//load product info to the UI
let getDetailProduct = () => {
    loadDetailById();
}
//logout reset all storage save info of account
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