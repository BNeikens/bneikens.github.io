(function ($) {
  'use strict';

  $(function () {
    $('a.page-scroll').on('click', function (event) {
      var targetSelector = $(this).attr('href');
      var $target = $(targetSelector);

      if (!$target.length) {
        return;
      }

      event.preventDefault();
      $('html, body').stop().animate({
        scrollTop: Math.max($target.offset().top - 68, 0)
      }, 900, 'easeInOutExpo');
    });

    $('body').scrollspy({
      target: '.navbar-fixed-top',
      offset: 90
    });

    $('.navbar-collapse a.page-scroll').on('click', function () {
      if ($('.navbar-toggle').is(':visible')) {
        $('.navbar-toggle').trigger('click');
      }
    });

    $('.navbar-toggle').on('click', function () {
      var isExpanded = $(this).attr('aria-expanded') === 'true';
      $(this).attr('aria-expanded', String(!isExpanded));
    });
  });
}(jQuery));
