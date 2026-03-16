{#/*============================================================================
	  #Sliders
	============================================================================*/ #}

	createSwiper( 
        '.js-swiper-advertising',
        {
            lazy: true,
            freeMode: { enabled: true, momentum: false },
            loop: true,
            preloadImages: false,
            watchOverflow: true,
            allowTouchMove: false,
            autoplay: {
                delay: 0,
                disableOnInteraction: false,
                pauseOnMouseEnter: false,
            },
            speed: 3500,
            spaceBetween: 20,
            slidesPerView: 'auto',
            breakpoints: {
                768: {
                    spaceBetween: 50,
                    slidesPerView: 'auto',
                }
            },
        }
    );

	// Swiper para variantes de color en ítems (cuando hay > 2 colores)
	createSwiper('.js-swiper-colors', {
		lazy: false,
		preloadImages: false,
		watchOverflow: true,
		loop: false,

		// cuántos se ven a la vez
		slidesPerView: 2,
		spaceBetween: 2,

		// 👇 clave: desplazar SOLO 1 bullet por click
		slidesPerGroup: 1,

		// nada de centrado ni freeMode para que sean pasos limpios
		centeredSlides: false,
		freeMode: false,

		navigation: {
			nextEl: '.js-swiper-colors-next',
			prevEl: '.js-swiper-colors-prev'
		},

		breakpoints: {
			768: {
			slidesPerView: 2,
			slidesPerGroup: 1, // también en desktop
			spaceBetween: 4
			}
		}
		});




{% if template == 'home'  or template == 'page'%}
 
	{# /* // Home slider */ #}
	var width = window.innerWidth;
	
	if (width > 767) {  
		var slider_autoplay = {delay:  6000,};
	} else {
		var slider_autoplay = {delay: 6000};
	}

	window.homeSlider = {
		getAutoRotation: function() {
			return slider_autoplay;
		},
		updateSlides: function(slides) {
			homeSwiper.removeAllSlides();
			slides.forEach(function(aSlide){
				homeSwiper.appendSlide(
					'<div class="swiper-slide slide-container">' +
						(aSlide.link ? '<a href="' + aSlide.link + '">' : '' ) +
							'<img src="' + aSlide.src + '" class="slider-image"/>' +
							'<div class="swiper-text swiper-' + aSlide.color + '">' +
								(aSlide.title ? '<div class="swiper-title">' + aSlide.title + '</div>' : '' ) +
								(aSlide.description ? '<div class="swiper-description mb-3">' + aSlide.description + '</div>' : '' ) +
								(aSlide.button && aSlide.link ? '<div class="btn btn-primary d-inline-block mt-3">' + aSlide.button + '</div>' : '' ) +
							'</div>' +
						(aSlide.link ? '</a>' : '' ) +
					'</div>'
				);
			});
			if(!slides.length){
						jQueryNuvem(".js-home-main-slider-container").addClass("hidden");
						jQueryNuvem(".js-home-empty-slider-container").removeClass("hidden");
						jQueryNuvem(".js-home-mobile-slider-visibility").removeClass("d-md-none");
				{% if has_mobile_slider %}
						jQueryNuvem(".js-home-main-slider-visibility").removeClass("d-none d-md-block");
						homeMobileSwiper.update();
				{% endif %}
			} else {
				jQueryNuvem(".js-home-main-slider-container").removeClass("hidden");
				jQueryNuvem(".js-home-empty-slider-container").addClass("hidden");
				jQueryNuvem(".js-home-mobile-slider-visibility").addClass("d-md-none");
				{% if has_mobile_slider %}
				jQueryNuvem(".js-home-main-slider-visibility").addClass("d-none d-md-block");
				{% endif %}
			}
		},
		changeAutoRotation: function(){

		},
	};

	var preloadImagesValue = false;
	var lazyValue = true;
	var loopValue = true;
	var watchOverflowValue = true;
	var paginationClickableValue = true;
	var homeSwiper = null;

	function changeNavColors(swiper, buttonQuery) {
		const index_currentSlide = swiper.realIndex;
		const currentSlide = swiper.slides[index_currentSlide];
		const slideButtonNavs = jQueryNuvem(buttonQuery);
		let color = currentSlide.dataset.slideColor;
		if(color === "dark"){
			slideButtonNavs.each(btn => { 
				jQueryNuvem(btn).addClass('svg-icon-text').removeClass('svg-icon-invert');
			});
		} else {
			slideButtonNavs.each(btn => { 
				jQueryNuvem(btn).addClass('svg-icon-invert').removeClass('svg-icon-text');
			});
		}
	}

	createSwiper(
		'.js-home-slider',
		{
			lazy: lazyValue,
			preloadImages: preloadImagesValue,
			{% if settings.slider | length > 1 %}
				loop: loopValue,
			{% endif %}
			autoplay: slider_autoplay,
			watchOverflow: watchOverflowValue,
			navigation: {
				nextEl: '.js-swiper-home-next',
				prevEl: '.js-swiper-home-prev',
			},
			on: {
				slideChange: function() {
					if(width > 767){
						changeNavColors(this, ".js-swiper-home-control.swiper-button-prev  svg, .js-swiper-home-control.swiper-button-next  svg");
					}
				}
			}
		},
		function(swiperInstance) {
			homeSwiper = swiperInstance;
		}
	);

	var homeMobileSwiper = null;
	createSwiper(
		'.js-home-slider-mobile',
		{
			lazy: lazyValue,
			preloadImages: preloadImagesValue,
			{% if settings.slider_mobile | length > 1 %}
				loop: loopValue,
			{% endif %}
			autoplay: slider_autoplay,
			watchOverflow: watchOverflowValue,
			navigation: {
				nextEl: '.js-swiper-home-next-mobile',
				prevEl: '.js-swiper-home-prev-mobile',
			},
			on: {
				slideChange: function() {
					if(width < 768){
						changeNavColors(this, ".js-swiper-home-control.js-swiper-home-prev-mobile svg, .js-swiper-home-control.js-swiper-home-next-mobile svg");
					}
				}
			}
		},
		function(swiperInstance) {
			homeMobileSwiper = swiperInstance;
		}
	);

	createSwiper(
		'.js-swiper-categories',
		{
			lazy: lazyValue,
			loop: true,
			preloadImages: preloadImagesValue,
			watchOverflow: watchOverflowValue,
			spaceBetween: 15,
			slidesPerView: 1.5,
			centeredSlides: true,
			navigation: {
				nextEl: '.js-swiper-categories-next',
				prevEl: '.js-swiper-categories-prev',
			},
			pagination: {
				el: '.js-swiper-categories-pagination',
				clickable: true,
			},
			breakpoints: {
				768: {
					loop: true,
					spaceBetween: 30,
					slidesPerView: 2.2,
					centeredSlides: true,
				}
			},
		},
		function(swiperInstance) {
			categoriesSwiper = swiperInstance;
		}
	);


	createSwiper(
		'.js-swiper-brands',
		{
			lazy: lazyValue,
			freeMode: true,
			loop: true,
			preloadImages: preloadImagesValue,
			watchOverflow: watchOverflowValue,
			autoplay: {
				delay: 0,
				disableOnInteraction: false,
    			pauseOnMouseEnter: false,
			},
			speed: 6500,
			spaceBetween: 25,
			slidesPerView: 4,
			breakpoints: {
				768: {
					loop: true,
					spaceBetween: 50,
					slidesPerView: 8,
				}
			},
		},
		function(swiperInstance) {
			brandSwiper = swiperInstance;
		}
	);

{% endif %}
	
{% if template == 'home' or template == '404' %}
	{% if settings.product_color_variants or settings.quick_shop %}
		{# Duplicate cloned slide elements for quickshop or colors forms #}
		updateClonedItemsIDs = function(element){
			jQueryNuvem(element).each(function(el) {
				var $this = jQueryNuvem(el);
				var slide_index = $this.attr("data-swiper-slide-index");
				var clone_quick_id = $this.find(".js-quickshop-container").attr("data-quickshop-id");
				var clone_product_id = $this.attr("data-product-id");
				$this.attr("data-product-id" , clone_product_id + "-clone-" + slide_index);
				$this.find(".js-quickshop-container").attr("data-quickshop-id" , clone_quick_id + "-clone-" + slide_index);
			});
		};
	{% endif %}

	{% set columns = settings.grid_columns %}
	
	{% for section in sections | flatten %}
  {% if section is defined and section|length and section.id is defined %}
    {# Claves dinámicas según el id de la sección #}
    {% set key_mobile  = section.id ~ '_product_mobile' %}
    {% set key_desktop = section.id ~ '_product_desktop' %}

    {# Lee settings con fallback y castea a número con +0 #}
    {% set slides_mobile  = (attribute(settings, key_mobile)  | default(2)) + 0 %}
    {% set slides_desktop = (attribute(settings, key_desktop) | default(4)) + 0 %}

    {# Flag para el bloque on #}
    {% set needs_on = settings.product_color_variants or settings.quick_shop %}

    createSwiper('.js-swiper-{{ section.id }}', {
      lazy: true,
      loop: true,
      spaceBetween: 20,
      threshold: 5,
      watchSlidesVisibility: true,
      slideVisibleClass: 'js-swiper-slide-visible',
      slidesPerView: 1.35,            // ← inyectar número
      navigation: {
        nextEl: '.js-swiper-{{ section.id }}-next',
        prevEl: '.js-swiper-{{ section.id }}-prev'
      },
      breakpoints: {
        640:  1.2,
        1024: { slidesPerView: {{ slides_desktop }} }
      }{% if needs_on %},
      on: {
        init: function () {
          updateClonedItemsIDs(".js-swiper-{{ section.id }} .js-item-slide.swiper-slide-duplicate");
        }
      }{% endif %}
    });
  {% endif %}
{% endfor %}

	function loadCollection(productSection, collectionId) {
		const tpl = productSection.find('.product-slider-with-nav-collection[data-nav-list-key-for="'+collectionId+'"]').first();
		const swiper = productSection.find('.swiper-container').first().get(0)[0].swiper;
		const wrapper = productSection.find('.swiper-wrapper').first();
		if (!tpl) return;

		wrapper.empty();
		tpl.find('.swiper-slide').clone().appendTo(wrapper);
		swiper.loopDestroy();
		swiper.loopCreate();
		swiper.update();
		swiper.slideTo(0, 100);
	}

	jQueryNuvem(document).on('click', '.product-slider-with-nav .js-swiper-nav-button', function (e) {
		e.preventDefault();
		const $btn = jQueryNuvem(this);
		const productSection = $btn.closest('.product-slider-with-nav').first();
		if ($btn.hasClass('active')) return;

		productSection.find('.js-swiper-nav-button').each(function (b) {
			const isActive = b === $btn.get(0)[0];

			if(isActive) {
				jQueryNuvem(b).addClass('active', isActive) 
			} else {
				jQueryNuvem(b).removeClass('active', isActive) 
			}
			jQueryNuvem(b).attr('aria-selected', isActive ? 'true' : 'false');
		});

		const id = $btn.data('navListKey');
		loadCollection(productSection,id);
	});

	if (width < 768) {
		createSwiper('.js-swiper-banner-navigation', {
			lazy: true,
			loop: true,
			spaceBetween: 0,
			threshold: 5,
			watchSlidesVisibility: true,
			slideVisibleClass: 'js-swiper-slide-visible',
			slidesPerView: 1.2,
			centeredSlides: true
		});
		 createSwiper('.js-swiper-ramificadores', {
			lazy: true,
			watchOverflow: true,
			loop: true,
			slidesPerView: 2.5,
			spaceBetween: 10,
			centeredSlides: true,
			initialSlide: 1,
			navigation: {
			nextEl: '.js-swiper-ramificadores-next',
			prevEl: '.js-swiper-ramificadores-prev'
			}
		});
	}

{% endif %}

{% if template == 'product' %}

	{# /* // Product Related */ #}
	{# // Set loop for related products products sliders #}
	{% set columns = settings.grid_columns %}
	const desktopColumns = {% if columns == 1 %}3{% else %}4{% endif %};
			
	function calculateRelatedLoopVal(sectionSelector) {                
		let productsAmount = jQueryNuvem(sectionSelector).attr("data-related-amount");
		let loopVal = false;
		const applyLoop = (window.innerWidth < 768 && productsAmount > {{ columns }}) || (window.innerWidth > 768 && productsAmount > desktopColumns);
		if (applyLoop) {
			loopVal = true;
		}
		return loopVal;
	}

	let alternativeLoopVal = calculateRelatedLoopVal(".js-related-products");
	let complementaryLoopVal = calculateRelatedLoopVal(".js-complementary-products");

	{# Alternative products #}
	createSwiper('.js-swiper-related', {
		lazy: true,
		watchOverflow: true,
		loop: alternativeLoopVal,
		centerInsufficientSlides: true,
		spaceBetween: 30,
		slidesPerView: {{ columns }},
		pagination: {
			el: '.js-swiper-related-pagination',
			clickable: true,
		},
		navigation: {
			nextEl: '.js-swiper-related-next',
			prevEl: '.js-swiper-related-prev',
		},
		breakpoints: {
			767: {
				slidesPerView: desktopColumns,
			}
		}
	});

	{# Complementary products #}
	createSwiper('.js-swiper-complementary', {
		lazy: true,
		watchOverflow: true,
		loop: complementaryLoopVal,
		centerInsufficientSlides: true,
		spaceBetween: 30,
		slidesPerView: {{ columns }},
		pagination: {
			el: '.js-swiper-complementary-pagination',
			clickable: true,
		},
		navigation: {
			nextEl: '.js-swiper-complementary-next',
			prevEl: '.js-swiper-complementary-prev',
		},
		breakpoints: {
			767: {
				slidesPerView: desktopColumns,
			}
		}
	});

	{# /* // Product thumbs swiper */ #}
	createSwiper('.js-swiper-product-thumbs', {
		lazy: true,
		watchOverflow: true,
		threshold: 5,
		slidesPerView: 2,
		spaceBetween: 10,
		direction: 'vertical',
		navigation: {
			nextEl: '.js-swiper-product-thumbs-next',
			prevEl: '.js-swiper-product-thumbs-prev',
		},
		thumbs: {
			swiper: '.js-swiper-product',
		}
	});


{% endif %}


{% set has_banner_services = settings.banner_services %}

{% if has_banner_services %}

	{# /* // Banner services slider */ #}

	var width = window.innerWidth;
			        if (width < 767) {   
			            createSwiper('.js-informative-banners', {
							slidesPerView: 1,
							spaceBetween: 15,
			                navigation: {
								nextEl: '.js-informative-banners-next',
								prevEl: '.js-informative-banners-prev',
							},
			            });
			        }

{% endif %}

{% if template == 'page' %}
	var width = window.innerWidth;
	if(width < 768){
		createSwiper('.js-swiper-landing-contact-mobile', { 
			lazy: true,
			loop: true,
			watchOverflow: true,
			slidesPerView: 3.25,
			centerInsufficientSlides: true,
			spaceBetween: 35
		});			
	}
{% endif %}