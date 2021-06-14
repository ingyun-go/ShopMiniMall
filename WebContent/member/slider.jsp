<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>

<script src="js/swiper.min.js"></script>
<link rel="stylesheet" href="css/swiper.min.css">

<!-- Swiper -->
<div class="swiper-container">
	<div class="swiper-wrapper">
		<div class="swiper-slide" style="background-image: url(images/main_1.jpg); width: 100%; height: 600px"></div>
		<div class="swiper-slide" style="background-image: url(images/main_2.jpg); width: 100%; height: 600px"></div>
		<div class="swiper-slide" style="background-image: url(images/main_3.jpg); width: 100%; height: 600px"></div>
	</div>
	<!-- Add Pagination -->
	<div class="swiper-pagination swiper-pagination-white"></div>
	<!-- Add Arrows -->
	<div class="swiper-button-next swiper-button-white"></div>
	<div class="swiper-button-prev swiper-button-white"></div>
</div>

<!-- Initialize Swiper -->
<script>
    var swiper = new Swiper('.swiper-container', {
      spaceBetween: 30,
      effect: 'fade',
      pagination: {
        el: '.swiper-pagination',
        clickable: true,
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
    });
  </script>
