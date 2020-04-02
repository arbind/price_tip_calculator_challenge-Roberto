$(document).ready(function() {
  
  // Initialize Sliders
  $('.home-logos-slider').slick({
    slidesToShow: 2,
    slidesToScroll: 2,
    mobileFirst: true,
    dots: false,
    arrows: false,
    responsive: [
      {
              breakpoint: 768,
              settings: 'unslick'
      }
    ]
  });
  // Initialize Sliders
  $('.featured-events-slider').slick({
    infinite: true,
    slidesToShow: 3,
    slidesToScroll: 3,
    arrows: true,
    dots: true,
    nextArrow: '<i class="fa fa-chevron-right slick-next"></i>',
    prevArrow: '<i class="fa fa-chevron-left slick-prev"></i>',
    responsive: [
      {
        breakpoint: 1024,
        settings: {
          slidesToShow: 2,
          slidesToScroll: 2
        }
      },
      {
        breakpoint: 480,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1
        }
      }
    ]
  });

  $('.testimonial-slider').slick({
    infinite: true,
    slidesToShow: 3,
    slidesToScroll: 3,
    arrows: true,
    dots: true,
    nextArrow: '<i class="fa fa-chevron-right slick-next"></i>',
    prevArrow: '<i class="fa fa-chevron-left slick-prev"></i>',
    responsive: [
      {
        breakpoint: 1024,
        settings: {
          slidesToShow: 2,
          slidesToScroll: 2
        }
      },
      {
        breakpoint: 480,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1
        }
      }
    ]
  });

  $('.sponsor-high-slider').slick({
    infinite: true,
    slidesToShow: 1,
    slidesToScroll: 1,
    arrows: true,
    dots: true,
    nextArrow: '<i class="fa fa-chevron-right slick-next"></i>',
    prevArrow: '<i class="fa fa-chevron-left slick-prev"></i>'
  });

}); // End of use strict
