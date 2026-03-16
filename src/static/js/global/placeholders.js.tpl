    {#/*============================================================================
      #Empty placeholders
    ==============================================================================*/ #}

    {% set show_help = not has_products %}

    {% if template == 'home' %}

        {# /* // Home slider */ #}

        var width = window.innerWidth;
        if (width > 767) {  
            var slider_empty_autoplay = {delay: 6000,};
        } else {
            var slider_empty_autoplay = false;
        }

        window.homeEmptySlider = {
            getAutoRotation: function() {
                return slider_empty_autoplay;
            },
        };
        createSwiper('.js-home-empty-slider', {
            loop: true,
            autoplay: slider_empty_autoplay,
            pagination: {
                el: '.js-swiper-empty-home-pagination',
                clickable: true,
            },
            navigation: {
                nextEl: '.js-swiper-empty-home-next',
                prevEl: '.js-swiper-empty-home-prev',
            },
        });

        {# /* // Home demo products slider */ #}

        {% set columns = settings.grid_columns %}

        createSwiper('.js-swiper-featured-demo', {
            slidesPerView: {% if columns == 2 %}2{% else %}1{% endif %},
            spaceBetween: 30,
            navigation: {
                nextEl: '.js-swiper-featured-demo-next',
                prevEl: '.js-swiper-featured-demo-prev',
            },
            pagination: {
                el: '.js-swiper-featured-demo-pagination',
                clickable: true,
            },
            breakpoints: {
                640: {
                    slidesPerView: {% if columns == 2 %}4{% else %}3{% endif %},
                }
            },
        });

        {# /* // Banner services slider */ #}

        if (width < 767) {   
            createSwiper('.js-informative-banners-demo', {
                pagination: {
                    el: '.js-informative-banners-demo-pagination',
                    clickable: true,
                },
            });
        }

    {% endif %}

    {% if template == '404' and show_help %}

        {# /* // Product Related */ #}

        {% set columns = settings.grid_columns %}
        const desktopColumns = {% if columns == 1 %}3{% else %}4{% endif %};

        createSwiper('.js-swiper-related-demo', {
            lazy: true,
            watchOverflow: true,
            loop: true,
            spaceBetween: 30,
            slidesPerView: {{ columns }},
            pagination: {
                el: '.js-swiper-related-demo-pagination',
                clickable: true,
            },
            navigation: {
                nextEl: '.js-swiper-related-demo-next',
                prevEl: '.js-swiper-related-demo-prev',
            },
            breakpoints: {
                767: {
                    slidesPerView: desktopColumns,
                }
            }
        });

        {# /* // Product slider */ #}

        createSwiper('.js-swiper-product-demo', {
            lazy: true,
            loop: false,
            pagination: {
                el: '.js-swiper-product-demo-pagination',
                type: 'fraction',
                clickable: true,
            },
        });

        {# /* 404 handling to show the example product */ #}

        if (/\/product\/example\/?$/.test(window.location.pathname)) {
            document.title = "{{ "Producto de ejemplo" | translate | escape('js') }}";
            $("#404").hide();
            $("#product-example").show();
        } else {
            $("#product-example").hide();
        }

    {% endif %}