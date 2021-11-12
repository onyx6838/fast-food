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
    var get = jqxhr('GET', 'combos?page=1&size=5');
    get.done((data) => {
        loadCombo(data.content);
    }).fail((jqXHR, textStatus, errorThrown) => {
        console.log(textStatus + ': ' + errorThrown);
    });
}
/**
 * GET Combo in menu page (updated)
 */
let getComboMenuPage = () => {
    var query = `combos?page=${pageNumber}&size=${size}`;

    var name = $('#search-product-with-cate').val();

    if (name) query += `&name=${name}`

    var getCombos = jqxhr('GET', query);
    getCombos.done((data) => {
        loadProduct(data.content, 'comboUI');
        loadSearchBar(0); // 0 value for outside category product (category id at least 1)
        paging(data.totalPages, 0) // equivalent
    }).fail((jqXHR, textStatus, errorThrown) => {
        console.log(textStatus + ': ' + errorThrown);
    });
}
/**
 * GET Combo By id in detail page
 */
let getComboById = (id, isCombo) => {
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
 * GET Product by category in menu page (with paging and search name)
 */
let getProductByCategoryV1 = (id) => {
    var query = `categories/${id}/products?page=${pageNumber}&size=${size}&sort=${sortField}`;

    var name = $('#search-product-with-cate').val();

    if (name) query += `&name=${name}`
    var products = jqxhr('GET', query);
    products.done((data) => {
        loadSearchBar(id); // clear button with cateId and assign new id to onclick
        loadProduct(data.content); // load new product
        paging(data.totalPages, id) // paging
    }).fail((jqXHR, textStatus, errorThrown) => {
        console.log(textStatus + ': ' + errorThrown);
    });
}

let handleSearch = (id) => {
    resetPaging();
    id === 0 ? getComboMenuPage() : getProductByCategoryV1(id);
}

let swPaging = (id, changePaging) => {
    newPaging = changePaging;
    if (newPaging) resetPaging();
    getProductByCategoryV1(id);
}

let swPagingCombo = (changePaging) => {
    newPaging = changePaging;
    if (newPaging) resetPaging();
    getComboMenuPage();
}

/**
 * Paging for product with cateId
 */
var pageNumber = 1;
var size = 2;
var maxPage = 2;
var sortField = 'name';
var newPaging = false;  // switch between category and combo

let paging = (pageCount, id) => {
    $('.pagination-area').empty();
    let pagingStr = '';

    let startPageIndex = Math.max(1, pageNumber - maxPage / 2);
    let endPageIndex = Math.min(pageCount, pageNumber + maxPage / 2);

    if (pageNumber != 1) {
        pagingStr +=
            `
            <a class="prev page-numbers" onclick="prevPaging(${id})">
                <i class="flaticon-left-arrow-1"></i>
             </a>
            `
    }

    for (i = startPageIndex; i <= endPageIndex; i++) {
        pagingStr +=
            `<a class="page-numbers ${pageNumber == i ? 'current' : ''}" 
        onclick="changePage(${i}, ${id})">${i}</a>`;
    }

    if (pageNumber != pageCount && pageCount > 0) { // avoid category has no item
        pagingStr +=
            `
            <a class="prev page-numbers" onclick="nextPaging(${id})">
                <i class="flaticon-right-arrow-1"></i>
             </a>
            `
    }

    $('.pagination-area').append(pagingStr);
}

let resetPaging = () => pageNumber = 1;

let prevPaging = id => changePage(pageNumber - 1, id);

let nextPaging = id => changePage(pageNumber + 1, id);

let changePage = (page, id) => {
    if (page == pageNumber) return;
    pageNumber = page;
    if (id === 0 || id === undefined) getComboMenuPage()
    else getProductByCategoryV1(id);
}