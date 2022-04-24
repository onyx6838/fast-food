/**
 * Api handler
 */
let ApiProducts = jqxhr("GET", "products").then((result) =>
  productsHandler(result.content)
);

let productsHandler = (data) =>
  localStorage.setItem("prod", JSON.stringify([...data]));

let ApiCombos = jqxhr("GET", "combos").then((result) => combosHandler(result));

let combosHandler = (data) =>
  localStorage.setItem("comb", JSON.stringify([...data.content]));

/**
 * Setup cart localstr
 */
let cart = localStorage.getItem("cart") ?
  JSON.parse(localStorage.getItem("cart")) : [];

/**
 * UI handler
 */
const showCart = () => {
  loadCart(cart);
};
/**
 * quantity product
 */
const popCart = () => {
  $("div.cart-btn span").text(
    cart.reduce((accu, item) => (accu += item.qty), 0)
  );
};

popCart();
/**
 * Cart handler
 * @param {id product} id
 * @param {có phải combo?} isCombo
 * @returns
 */
const getIndex = (id, isCombo) =>
  cart.indexOf(cart.find((item) => item.id === id && item.isCombo === isCombo));
/**
 * call api add cart
 * @param {*} id
 * @param {*} isCombo
 * @param {*} quantity
 */
const addToCart = (id, isCombo, quantity) => {
  let data = JSON.parse(localStorage.getItem("product-detail"));
  let products = JSON.parse(localStorage.getItem("prod"));
  let combos = JSON.parse(localStorage.getItem("comb"));

  // if (isCombo === true) {
  //   let comboQuantity = combos.find(item => item.id === id);
  //   if (comboQuantity === 0) {
  //     outOfQuantity()
  //   }
  // } else if (isCombo === false) {
  //   let productQuantity = products.find(item => item.id === id);
  //   if (productQuantity === 0) {
  //     outOfQuantity()
  //   }
  // }

  if (data.quantity === null || data.quantity === undefined || data.quantity === 0) {
    outOfQuantity()
  } else if (quantity > data.quantity) {
    overQuantity();
  } else {
    //notification add to cart success
    successSwal().then(() => {
      //If the cart already has products, check if there are products to add, add the quantity, otherwise, add a new item to the cart.
      if (cart.length > 0) {
        getIndex(id, isCombo) > -1 ?
          quantity ?
          (cart[getIndex(id, isCombo)].qty += quantity) :
          (cart[getIndex(id, isCombo)].qty += 1) :
          cart.push({
            id: id,
            qty: quantity ? quantity : 1,
            isCombo: isCombo,
          });
      } else {
        quantity
          ?
          cart.push({
            id,
            qty: quantity,
            isCombo: isCombo,
          }) :
          cart.push({
            id,
            qty: 1,
            isCombo: isCombo,
          });
      }
      localStorage.setItem("cart", JSON.stringify(cart));
      popCart();
      //getDetailProduct();
    });
  }
};
/**
 * update item cart (tăng giảm số lượng)
 * @param {id product} id
 * @param {tăng hoặc giảm} stk
 * @param {có là combo?} isCombo
 */
const updateCartItem = (id, stk, isCombo) => {
  if (getIndex(id, isCombo) > -1) {
    if (cart[getIndex(id, isCombo)].qty == 1 && stk == -1) {
      deleteSwal().then((result) => {
        if (result.isConfirmed) {
          cart.splice(getIndex(id, isCombo), 1);
        }
      });
    } else {
      //cart.find(item => item.id === getIndex(id) && item.isCombo === isCombo).qty += stk;
      cart[getIndex(id, isCombo)].qty += stk;
    }
  }
  localStorage.setItem("cart", JSON.stringify(cart));
  popCart();
  showCart();
  getDetailProduct();
};
/**
 * delete item cart
 * @param {id product} id
 * @param {có là combo?} isCombo
 */
const removeCartItem = (id, isCombo) => {
  deleteSwal().then((result) => {
    if (result.isConfirmed) {
      cart.splice(getIndex(id, isCombo), 1);
      localStorage.setItem("cart", JSON.stringify(cart));
      popCart();
      showCart();
    }
  });
};
/**
 * delete All cart
 */
const resetCart = () => {
  deleteAllSwal().then((result) => {
    if (result.isConfirmed) {
      cart.splice(0, cart.length);
      localStorage.setItem("cart", cart);
      popCart();
      showCart();
    }
  });
};
/**
 * Checkout handler
 */
const redCheckout = () => {
  if (
    JSON.parse(localStorage.getItem("cart")).length === 0
  ) {
    Swal.fire("Chưa có sản phẩm trong giỏ");
  } else if (
    storage.getItem("ID") == null &&
    storage.getItem("ID") == undefined
  ) {
    ignoreSwal().then(() => {
      window.open("sign-in.html");
      return;
    });
  } else {
    window.open("checkout.html");
  }
};
/**
 * display checkout form info order
 */
const showCheckoutCart = () => {
  loadCartCheckout(cart);
};
/**
 * display checkout form info customer
 */
const showCheckoutOrder = () => {
  loadCheckoutOrder();
};
/**
 * sự kiện thanh toán
 */
const checkOut = () => {
  if (storage.getItem("ID") == null && storage.getItem("ID") == undefined) {
    ignoreSwal().then(() => {
      window.open("sign-in.html");
      return;
    });
  } else {
    let address = $("#ip-address").val();
    let province = $("#ip-province").val();
    let district = $("#ip-checkbox-district").children(":selected").text();
    let ward = $("#ip-checkbox-ward").children(":selected").text();

    let notes = $("#ip-notes").val();
    let contact = $("#ip-phone").val();

    // valid address (blank, empty)
    if (validator.blank(address) || !address.replace(/\s/g, '').length) {
      showNameErrMsgForCheckout('name-err-msg-address', 'Chưa nhập địa chỉ')
      setInterval(() => hideNameErrMsgForCheckout('name-err-msg-address', 'none'), 3000)
      return;
    }
    // valid address (blank, empty, regex)
    if (validator.blank(contact) || !contact.replace(/\s/g, '').length) {
      showNameErrMsgForCheckout('name-err-msg-phone', 'Chưa nhập sdt')
      setInterval(() => hideNameErrMsgForCheckout('name-err-msg-phone', 'none'), 3000)
      return;
    }

    if (validator.phone(contact)) {
      showNameErrMsgForCheckout('name-err-msg-phone', 'theo định dạng sdt Viet Nam')
      setInterval(() => hideNameErrMsgForCheckout('name-err-msg-phone', 'none'), 3000)
      return;
    }

    if ($("#ip-checkbox-district").val() === "") {
      showNameErrMsgForCheckout('name-err-msg-district', 'Chưa chọn Quận')
      setInterval(() => hideNameErrMsgForCheckout('name-err-msg-district', 'none'), 3000)
      return;
    }

    if ($("#ip-checkbox-ward").val() === "") {
      showNameErrMsgForCheckout('name-err-msg-ward', 'Chưa chọn Phường')
      setInterval(() => hideNameErrMsgForCheckout('name-err-msg-ward', 'none'), 3000)
      return;
    }

    let products = JSON.parse(localStorage.getItem("prod"));
    let combos = JSON.parse(localStorage.getItem("comb"));

    let orderRequest = {
      order: {
        customerId: storage.getItem("ID"),
        name: storage.getItem("FULL_NAME"),
        address: address,
        contact: contact,
        district: district,
        province: province,
        ward: ward,
        note: notes,
        username: storage.getItem("USERNAME"),
        totalPrice: cart.reduce(
          (accu, item, i) =>
          (accu +=
            item.qty *
            (item.isCombo ?
              combos[item.id - 1].totalPrice :
              products[item.id - 1].price)),
          0
        ),
      },
      cart: cart,
    };

    $.ajax({
        url: "http://localhost:8080/api/v1/cart",
        type: "POST",
        data: JSON.stringify(orderRequest),
        contentType: "application/json",
        beforeSend: function (xhr) {
          xhr.setRequestHeader(
            "Authorization",
            "Bearer " + storage.getItem("TOKEN")
          );
        },
      })
      .done(() => successCheckoutSwal())
      .then(() =>
        setInterval(() => window.location.replace("index.html"), 3000)
      )
      .fail(() => ignoreCheckoutSwal());
  }
};

function showNameErrMsgForCheckout(block, message) {
  const selector = '#' + block
  $(selector).html(message);
  toggleErrMsg(selector, 'block');
}

function hideNameErrMsgForCheckout(block, style) {
  const selector = '#' + block
  $(selector).css('display', style);
}

function toggleErrMsg(block, style) {
  $(block).css('display', style);
}