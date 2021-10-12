/**
 * Slider Effect main page
 */
function sliderEffect() {
    $('.home-slider').owlCarousel({
        loop: true,
        margin: 0,
        nav: true,
        mouseDrag: true,
        items: 1,
        autoHeight: true,
        dots: false,
        dotData: true,
        autoplay: false,
        smartSpeed: 500,
        autoplayHoverPause: true,
        navText: ["<i class='flaticon-curve-arrow'></i>", "<i class='flaticon-curve-arrow-1'></i>", ],
    });
    $(".home-slider").on("translate.owl.carousel", function () {
        $(".slider-content img, .slider-content span, .slider-content h1, .slider-content .list, .slider-content .typewrite").removeClass("animated fadeInLeft").css("opacity", "0");
        $(".slider-content p").removeClass("animated fadeInLeft").css("opacity", "0");
        $(".slider-content a").removeClass("animated fadeInLeft").css("opacity", "0");
        $(".slider-image, .shape").removeClass("animated slideInUp").css("opacity", "0");
    });
    $(".home-slider").on("translated.owl.carousel", function () {
        $(".slider-content img, .slider-content span, .slider-content h1, .slider-content .list, .slider-content .typewrite").addClass("animated fadeInLeft").css("opacity", "1");
        $(".slider-content p").addClass("animated fadeInLeft").css("opacity", "1");
        $(".slider-content a").addClass("animated fadeInLeft").css("opacity", "1");
        $(".slider-image, .shape").addClass("animated slideInUp").css("opacity", "1");
    });

}
/**
 * Combo 
 */
function comboEffect() {
    $('.burger-shop-slider').owlCarousel({
        loop: true,
        nav: false,
        dots: true,
        smartSpeed: 2000,
        margin: 30,
        autoplayHoverPause: true,
        autoplay: true,
        responsive: {
            0: {
                items: 1
            },
            576: {
                items: 1
            },
            768: {
                items: 2
            },
            1024: {
                items: 3
            },
            1200: {
                items: 4
            }
        }
    });
}
/**
 * Category Effect
 */
function categoryEffect() {
    $('.tab ul.tabs').addClass('active').find('> li:eq(0)').addClass('current');
    $('.tab ul.tabs li a').on('click', function (g) {
        var tab = $(this).closest('.tab'),
            index = $(this).closest('li').index();
        tab.find('ul.tabs > li').removeClass('current');
        $(this).closest('li').addClass('current');
        tab.find('.tab_content').find('div.tabs_item').not('div.tabs_item:eq(' + index + ')').slideUp();
        tab.find('.tab_content').find('div.tabs_item:eq(' + index + ')').slideDown();
        g.preventDefault();
    });
}