/**
 * GET Food in menu page
 */
function getProduct() {
    var getProducts = jqxhr('GET', 'products');

    getProducts.done(function (data) {
        loadProduct(data.content);
    }).fail(function (jqXHR, textStatus, errorThrown) {
        console.log(textStatus + ': ' + errorThrown);
    });
}
/**
 * GET Food with createDate desc main page
 */
function getNewProduct() {
    var getNewProducts = jqxhr('GET', 'products?sort=CreatedDate,desc&size=4');

    getNewProducts.done(function (data) {
        loadNewProduct(data.content);
    }).fail(function (jqXHR, textStatus, errorThrown) {
        console.log(textStatus + ': ' + errorThrown);
    });
}
/**
 * GET Combo in main page
 */
function getCombo(){
    var getCombos = jqxhr('GET', 'combos');
    getCombos.done(function (data) {
        loadCombo(data);
    }).fail(function (jqXHR, textStatus, errorThrown) {
        console.log(textStatus + ': ' + errorThrown);
    });
}
/**
 * GET Category in menu page 
 */
function getCategory() {
    var getCombos = jqxhr('GET', 'categories?size=5');
    getCombos.done(function (data) {
        loadCategory(data.content);
    }).fail(function (jqXHR, textStatus, errorThrown) {
        console.log(textStatus + ': ' + errorThrown);
    });
}
