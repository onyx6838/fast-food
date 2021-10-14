/**
 * GET Food in menu page
 */
function getProduct() {
    // var url = "products";
    // var paging = "?page=" + pageNumber + "&size=" + size;

    // console.log(url + paging);
    // var getProducts = jqxhr('GET', url + paging);
    var getProducts = jqxhr('GET', 'products');
    getProducts.done(function (data) {
        loadProduct(data.content);
        //pagingTable(data.totalPages, url)
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
 * GET Food by id in detail page
 */
function getProductById(id) {
    var getProductById = jqxhr('GET', 'products/' + id);
    getProductById.done(function (data) {
        // (A) VARIABLES TO PASS
        // var first = "Foo Bar",
        //     second = ["Hello", "World"];

        // (B) URL PARAMETERS
        var params = new URLSearchParams();
        params.append("id", id);
        params.append("data", data);

        // (C) GO!
        var url = "product-details.html?" + id.toString();
        location.href = url;
        // window.open(url);

        // var newwin = window.open("product-details.html");
        // newwin.onload = function () {
        //     this.id = id;
        //     this.data = data;
        //     //loadProductById(id, data);
        // }
        //window.location.href = "http://127.0.0.1:5500/product-details.html";

    }).fail(function (jqXHR, textStatus, errorThrown) {
        console.log(textStatus + ': ' + errorThrown);
    });
}
/**
 * GET Combo in main page
 */
function getCombo() {
    var getCombos = jqxhr('GET', 'combos');
    getCombos.done(function (data) {
        loadCombo(data);
    }).fail(function (jqXHR, textStatus, errorThrown) {
        console.log(textStatus + ': ' + errorThrown);
    });
}
/**
 * GET Combo in menu page
 */
function getComboMenuPage() {
    // var url = "combos";
    // var paging = "?page=" + pageNumber + "&size=" + size;

    var getCombos = jqxhr('GET', "combos");
    getCombos.done(function (data) {
        loadComboMenuPage(data);
        //pagingTable(data.totalPages, url);
    }).fail(function (jqXHR, textStatus, errorThrown) {
        console.log(textStatus + ': ' + errorThrown);
    });
}
/**
 * GET Combo By id in detail page
 */
function getComboById(id) {
    console.log(id);
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
/**
 * GET Product by category in menu page 
 */
function getProductByCategory(id) {
    // var url = "products";
    // var paging = "?page=" + pageNumber + "&size=" + size;

    //console.log(url + paging);

    //var getProducts = jqxhr('GET', "url + paging");
    var products = jqxhr('GET', 'categories/' + id);
    products.done(function (data) {
        loadProduct(data);
        //pagingTable(data.)
    }).fail(function (jqXHR, textStatus, errorThrown) {
        console.log(textStatus + ': ' + errorThrown);
    });
}

/**
 * Paging
 */
var pageNumber = 1;
var size = 3;
var maxPage = 2;

function pagingTable(pageCount, pageOn) {
    var pagingStr = "";

    var startPageIndex = Math.max(1, pageNumber - maxPage / 2);
    var endPageIndex = Math.min(pageCount, pageNumber + maxPage / 2);
    //console.log(startPageIndex + " -- " + endPageIndex);

    if (pageNumber != 1) {
        pagingStr +=
            '<a class="prev page-numbers">' +
            '<i class="flaticon-left-arrow-1"> onClick="prevPaging()">Previous</i>' +
            '</a>';
    }

    for (i = startPageIndex; i <= endPageIndex; i++) {
        pagingStr +=
            '<a class="page-numbers ' + (pageNumber == i ? 'current" aria-current="page' : "") +
            '" ' + 'onClick="changePage(' + i + "," + pageOn +  ')">' + "</a>";
    }

    if (pageNumber != pageCount) {
        pagingStr +=
            '<a class="next page-numbers">' +
            '<i class="flaticon-right-arrow-1" onClick="nextPaging()">Next</i>' +
            '</a>';
    }

    /*
                        <a href="#" class="prev page-numbers">
                            <i class="flaticon-left-arrow-1"></i>
                        </a>
                        <a href="#" class="page-numbers">1</a>
                        <a class="page-numbers current" aria-current="page">2</a>
                        <a href="#" class="page-numbers">3</a>
                        <a href="#" class="page-numbers">4</a>
                        <a href="#" class="next page-numbers">
                            <i class="flaticon-right-arrow-1"></i>
                        </a>
    */

    $('.pagination-area').empty();
    $('.pagination-area').append(pagingStr);
}

function resetPaging() {
    pageNumber = 1;
}

function prevPaging() {
    changePage(pageNumber - 1);
}

function nextPaging() {
    changePage(pageNumber + 1);
}

function changePage(page, pageOn) {
    if (page == pageNumber) {
        return;
    }
    pageNumber = page;
    switch (pageOn) {
        case 'products':
            getProductByCategory();
            break;
        case 'combos':
            getComboMenuPage();
            break;
        default:
            break;
    }
    
}