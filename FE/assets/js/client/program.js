/**
 * GET Food in menu page
 */
let getProduct = () => {
    var getProducts = jqxhr('GET', 'products');
    getProducts.done((data) => {
        loadProduct(data.content);
    }).fail((jqXHR, textStatus, errorThrown) => {
        console.log(textStatus + ': ' + errorThrown);
    });
}
/**
 * GET Food with createDate desc main page
 */
let getNewProduct = () => {
    var getNewProducts = jqxhr('GET', 'products?sort=CreatedDate,desc&size=4');
    getNewProducts.done((data) => {
        loadNewProduct(data.content);
    }).fail((jqXHR, textStatus, errorThrown) => {
        console.log(textStatus + ': ' + errorThrown);
    });
}
/**
 * GET Food by id in detail page
 */
let getProductById = (id, isCombo) => {
    var get = jqxhr('GET', 'products/' + id);
    get.done((data) => {
        localStorage.setItem("product-detail", JSON.stringify({
            ...data,
            isCombo: isCombo,
            id: id
        }));
        window.open("product-details.html");
    }).fail((jqXHR, textStatus, errorThrown) => {
        console.log(textStatus + ': ' + errorThrown);
    });
}
/**
 * GET Combo in main page
 */
let getCombo = () => {
    var get = jqxhr('GET', 'combos');
    get.done((data) => {
        loadCombo(data);
    }).fail((jqXHR, textStatus, errorThrown) => {
        console.log(textStatus + ': ' + errorThrown);
    });
}
/**
 * GET Combo in menu page
 */
let getComboMenuPage = () => {
    var getCombos = jqxhr('GET', "combos");
    getCombos.done((data) => {
        loadProduct(data, 'comboUI');
    }).fail((jqXHR, textStatus, errorThrown) => {
        console.log(textStatus + ': ' + errorThrown);
    });
}
/**
 * GET Combo By id in detail page
 */
let getComboById = (id, isCombo) => {
    console.log(id);
    var get = jqxhr('GET', 'combos/' + id);
    get.done((data) => {
        localStorage.setItem("product-detail", JSON.stringify({
            ...data,
            isCombo: isCombo,
            id: id
        }));
        window.open("product-details.html");
    }).fail((jqXHR, textStatus, errorThrown) => {
        console.log(textStatus + ': ' + errorThrown);
    });
}
/**
 * GET Category in menu page 
 */
let getCategory = () => {
    var getCombos = jqxhr('GET', 'categories?size=5');
    getCombos.done((data) => {
        loadCategory(data.content);
    }).fail((jqXHR, textStatus, errorThrown) => {
        console.log(textStatus + ': ' + errorThrown);
    });
}
/**
 * GET Product by category in menu page 
 */
let getProductByCategory = (id) => {
    var products = jqxhr('GET', 'categories/' + id);
    products.done((data) => {
        loadProduct(data);
    }).fail((jqXHR, textStatus, errorThrown) => {
        console.log(textStatus + ': ' + errorThrown);
    });
}

/**
 * GET District with XML file to SelectBox
 */
let getDistrictFromXML = () => {
    var districts = jqxhr('GET', 'files/xml/districts');
    districts.done((data) => {
        loadDistrictFromXML(data);
    }).fail((jqXHR, textStatus, errorThrown) => {
        console.log(textStatus + ': ' + errorThrown);
    });
}

/**
 * GET precinct (ward) from XML file and UI control for selectBox changed
 */
const selectionChanged = () => {
    const districtId = $('#ip-checkbox-district').val() ? $('#ip-checkbox-district').val() : '';
    var precinct = jqxhr('GET', `files/xml/districts/${districtId && districtId}`);
    precinct.done((data) => {
        loadWardFromXML(data);
    }).fail((jqXHR, textStatus, errorThrown) => {
        console.log(textStatus + ': ' + errorThrown);
    });
}

/**
 * Paging (unused)
 */
let pageNumber = 1;
let size = 3;
let maxPage = 2;

let pagingTable = (pageCount, pageOn) => {
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
            '" ' + 'onClick="changePage(' + i + "," + pageOn + ')">' + "</a>";
    }

    if (pageNumber != pageCount) {
        pagingStr +=
            '<a class="next page-numbers">' +
            '<i class="flaticon-right-arrow-1" onClick="nextPaging()">Next</i>' +
            '</a>';
    }

    $('.pagination-area').empty();
    $('.pagination-area').append(pagingStr);
}

let resetPaging = () => pageNumber = 1;

let prevPaging = () => changePage(pageNumber - 1);

let nextPaging = () => changePage(pageNumber + 1);

let changePage = (page, pageOn) => {
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