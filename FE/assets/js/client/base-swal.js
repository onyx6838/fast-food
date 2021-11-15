const successSwal = () => Swal.fire({
    position: 'middle',
    icon: 'success',
    title: 'Đã thêm vào giỏ hàng',
    showConfirmButton: false,
    timer: 1000
})

const deleteSwal = () => Swal.fire({
    title: 'Xóa sản phẩm này trong giỏ hàng?',
    icon: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: 'Xác nhận',
    cancelButtonText: 'Hủy'
})

const deleteAllSwal = () => Swal.fire({
    title: 'Xóa tất cả sản phẩm trong giỏ hàng?',
    icon: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: 'Xác nhận',
    cancelButtonText: 'Hủy'
})

const ignoreSwal = () => Swal.fire({
    position: 'middle',
    icon: 'warning',
    title: 'Chưa Login',
    showConfirmButton: false,
    timer: 1000
})

const successRegisSwal = () => Swal.fire({
    position: 'middle',
    icon: 'success',
    title: 'Đăng Kí Thành Công, Kiểm tra email của bạn',
    showConfirmButton: false,
    timer: 1000
})

const successCheckoutSwal = () => Swal.fire({
    position: 'middle',
    icon: 'success',
    title: 'Đặt hàng thành công',
    showConfirmButton: false,
    timer: 1000
})

const ignoreCheckoutSwal = () => Swal.fire({
    position: 'middle',
    icon: 'error',
    title: 'Đặt hàng không thành công',
    showConfirmButton: false,
    timer: 1000
})

const ignoreAddToCartSwal = () => Swal.fire({
    position: 'middle',
    icon: 'warning',
    title: 'Hãy chọn số lượng muốn thêm vào giỏ',
    showConfirmButton: false,
    timer: 1000
})