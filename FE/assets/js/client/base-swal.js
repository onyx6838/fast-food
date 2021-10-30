const successSwal = () => Swal.fire({
    position: 'top-end',
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
    position: 'top-end',
    icon: 'warning',
    title: 'Chưa Login',
    showConfirmButton: false,
    timer: 1000
})

const successRegisSwal = () => Swal.fire({
    position: 'top-end',
    icon: 'success',
    title: 'Đăng Kí Thành Công',
    showConfirmButton: false,
    timer: 1000
})

const successCheckoutSwal = () => Swal.fire({
    position: 'top-end',
    icon: 'success',
    title: 'Đặt hàng thành công',
    showConfirmButton: false,
    timer: 1000
})


const ignoreCheckoutSwal = () => Swal.fire({
    position: 'top-end',
    icon: 'error',
    title: 'Đặt hàng không thành công',
    showConfirmButton: false,
    timer: 1000
})