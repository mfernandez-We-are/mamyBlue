{#/*============================================================================
	  #Cart
	==============================================================================*/ #}

    {# /* // Free shipping bar */ #}

    {% if cart.free_shipping.min_price_free_shipping.min_price %}

        {# Updates free progress on page load #}

        LS.freeShippingProgress(true);

    {% endif %}

    {# /* // Position of cart page summary */ #}

    var head_height = jQueryNuvem(".js-head-main").outerHeight();

    if (window.innerWidth > 768) {
        {% if settings.head_fix %}
            jQueryNuvem("#cart-sticky-summary").css("top" , (head_height + 10).toString() + 'px');
        {% else %}
            jQueryNuvem("#cart-sticky-summary").css("top" , "10px");
        {% endif %}
    }

     {# /* // Add to cart */ #}

	jQueryNuvem(document).on("click", ".js-addtocart:not(.js-addtocart-placeholder)", function (e) {

        {# Button variables for transitions on add to cart #}

        var $productContainer = jQueryNuvem(this).closest('.js-product-container');
        var $productVariants = $productContainer.find(".js-variation-option");
        var $productButton = $productContainer.find("input[type='submit'].js-addtocart");
        var $productButtonPlaceholder = $productContainer.find(".js-addtocart-placeholder");
        var $productButtonText = $productButtonPlaceholder.find(".js-addtocart-text");
        var $productButtonAdding = $productButtonPlaceholder.find(".js-addtocart-adding");
        var $productButtonSuccess = $productButtonPlaceholder.find(".js-addtocart-success");

        {# Define if event comes from quickshop or product page #}

        var isQuickShop = $productContainer.hasClass('js-quickshop-container');

        if (!isQuickShop) {
            if(jQueryNuvem(".js-product-slide-img.js-active-variant").length) {
                var imageSrc = $productContainer.find('.js-product-slide-img.js-active-variant').data('srcset').split(' ')[0];
            } else {
                var imageSrc = $productContainer.find('.js-product-slide-img').attr('srcset').split(' ')[0];
            }
            var name = $productContainer.find('.js-product-name').text();
            var price = $productContainer.find('.js-price-display').text();
        } else {
            var imageSrc = jQueryNuvem(this).closest('.js-quickshop-container').find('img').attr('srcset');
            var name = $productContainer.find('.js-item-name').text();
            var price = $productContainer.find('.js-price-display').text().trim(); 
        }

        var quantity = $productContainer.find('.js-quantity-input').val();
        var addedToCartCopy = "{{ 'Agregar al carrito' | translate }}";


        if (!jQueryNuvem(this).hasClass('contact')) {

            {% if settings.ajax_cart %}
                e.preventDefault();
            {% endif %}

            {# Hide real button and show button placeholder during event #}

            $productButton.hide();
            $productButtonPlaceholder.show().addClass("active");
            $productButtonText.removeClass("active");
            setTimeout(function(){
                $productButtonAdding.addClass("active");
            },300);

            {% if settings.ajax_cart %}

                var callback_add_to_cart = function(html_notification_related_products, html_notification_cross_selling) {

                    {# Animate cart amount #}

                    jQueryNuvem(".js-cart-widget-amount").addClass("beat");

                    setTimeout(function(){
                        jQueryNuvem(".js-cart-widget-amount").removeClass("beat");
                    },4000);

                    {# Fill notification info #}

                    jQueryNuvem('.js-cart-notification-item-img').attr('srcset', imageSrc);
                    jQueryNuvem('.js-cart-notification-item-name').text(name);
                    jQueryNuvem('.js-cart-notification-item-quantity').text(quantity);
                    jQueryNuvem('.js-cart-notification-item-price').text(price);

                    if($productVariants.length){
                        var output = [];

                        $productVariants.each( function(el){
                            var variants = jQueryNuvem(el);
                            output.push(variants.val());
                        });
                        jQueryNuvem(".js-cart-notification-item-variant-container").show();
                        jQueryNuvem(".js-cart-notification-item-variant").text(output.join(', '))
                    }else{
                        jQueryNuvem(".js-cart-notification-item-variant-container").hide();
                    }

                    {# Set products amount wording visibility #}

                    var cartItemsAmount = jQueryNuvem(".js-cart-widget-amount").text();

                    if(cartItemsAmount > 1){
                        jQueryNuvem(".js-cart-counts-plural").show();
                        jQueryNuvem(".js-cart-counts-singular").hide();
                    }else{
                        jQueryNuvem(".js-cart-counts-singular").show();
                        jQueryNuvem(".js-cart-counts-plural").hide();
                    }

                    {# Show button placeholder with transitions #}

                    $productButtonAdding.removeClass("active");

                    setTimeout(function(){
                        $productButtonSuccess.addClass("active");
                    },300);
                    setTimeout(function(){
                        $productButtonSuccess.removeClass("active");
                        setTimeout(function(){
                            $productButtonText.addClass("active");
                        },300);
                        $productButtonPlaceholder.removeClass("active");
                    },2000);

                    setTimeout(function(){
                        $productButtonPlaceholder.hide();
                        $productButton.css('display' , 'inline-block');
                    },4000);

                    $productContainer.find(".js-added-to-cart-product-message").slideDown();

                    if (isQuickShop) {
                        jQueryNuvem("#quickshop-modal").removeClass('modal-show');
                        jQueryNuvem(".js-modal-overlay[data-modal-id='#quickshop-modal']").hide();
                        jQueryNuvem("body").removeClass("overflow-none");
                        restoreQuickshopForm();
                        if (window.innerWidth < 768) {
                            cleanURLHash();
                        }
                    }

                    let notificationWithRelatedProducts = false;

                    {% if settings.add_to_cart_recommendations %}

                        {# Show added to cart product related products #}

                        function recommendProductsOnAddToCart(){

                            jQueryNuvem('.js-related-products-notification-container').html("");

                            modalOpen('#related-products-notification');

                            jQueryNuvem('.js-related-products-notification-container').html(html_notification_related_products).show();

                            {# Recommendations swiper #}

                            // Set loop for recommended products

                            function calculateRelatedNotificationLoopVal(sectionSelector) {
                                let productsAmount = jQueryNuvem(sectionSelector).attr("data-related-amount");
                                let loopVal = false;
                                const applyLoop = (window.innerWidth < 768 && productsAmount > 2) || (window.innerWidth > 768 && productsAmount > 3);
                                
                                if (applyLoop) {
                                    loopVal = true;
                                }
                                
                                return loopVal;
                            }

                            let cartRelatedLoopVal = calculateRelatedNotificationLoopVal(".js-related-products-notification");

                            // Create new swiper on add to cart

                            createSwiper('.js-swiper-related-products-notification', {
                                lazy: true,
                                loop: cartRelatedLoopVal,
                                watchOverflow: true,
                                threshold: 5,
                                watchSlideProgress: true,
                                watchSlidesVisibility: true,
                                spaceBetween: 15,
                                slideVisibleClass: 'js-swiper-slide-visible',
                                slidesPerView: 2,
                                pagination: {
                                    el: '.js-swiper-related-products-notification-pagination',
                                    clickable: true,
                                },
                                navigation: {
                                    nextEl: '.js-swiper-related-products-notification-next',
                                    prevEl: '.js-swiper-related-products-notification-prev',
                                },
                                breakpoints: {
                                    768: {
                                        slidesPerView: 3,
                                    }
                                }
                            });
                        }
                        
                        notificationWithRelatedProducts = html_notification_related_products != null;

                        if(notificationWithRelatedProducts){
                            if (isQuickShop) {
                                setTimeout(function(){
                                    recommendProductsOnAddToCart();
                                },300);
                            }else{
                                recommendProductsOnAddToCart();
                            }
                        }

                    {% endif %}

                    if(!notificationWithRelatedProducts){
                    
                        {# Show notification and hide it only after second added to cart #}

                        setTimeout(function(){
                            jQueryNuvem(".js-alert-added-to-cart").show().addClass("notification-visible").removeClass("notification-hidden");
                        },500);

                        if (!cookieService.get('first_product_added_successfully')) {
                            cookieService.set('first_product_added_successfully', 1, 7 ); 
                        } else{
                            setTimeout(function(){
                                jQueryNuvem(".js-alert-added-to-cart").removeClass("notification-visible").addClass("notification-hidden");
                                setTimeout(function(){
                                    jQueryNuvem('.js-cart-notification-item-img').attr('src', '');
                                    jQueryNuvem(".js-alert-added-to-cart").hide();
                                },2000);
                            },8000);
                        }
                    }

                    {# Display cross-selling promotion modal #}

                    let shouldDisplayCrossSellingNotification = html_notification_cross_selling != null;

                    if (shouldDisplayCrossSellingNotification) {
                        jQueryNuvem('.js-cross-selling-modal-body').html("");
                        modalOpen('#js-cross-selling-modal');
                        jQueryNuvem('.js-cross-selling-modal-body').html(html_notification_cross_selling).show();
                    }

                    {# Change prices on cross-selling promotion modal #}

                    const crossSellingContainer = document.querySelector('.js-cross-selling-container');

                    if (crossSellingContainer) {
                        const variants = JSON.parse(crossSellingContainer.dataset.variants || '[]');
                        const addToCartText = crossSellingContainer.dataset.addToCartTranslation;
                        const notAvailableText = crossSellingContainer.dataset.notAvailableTranslation;
                        const pricesContainer = crossSellingContainer.querySelector('.js-cross-selling-prices-container');
                        const originalPriceElem = crossSellingContainer.querySelector('.js-cross-selling-original-price');
                        const promoPriceElem = crossSellingContainer.querySelector('.js-cross-selling-promo-price');
                        const addToCartButton = crossSellingContainer.querySelector('.js-cross-selling-add-to-cart');
                        const variantOptionSelectors = [
                            '#js-cross-selling-option-value-1',
                            '#js-cross-selling-option-value-2',
                            '#js-cross-selling-option-value-3'
                        ];
                        function formatPrice(cents) {
                            return LS.currency.display_short
                                + parseFloat(cents / 100).toLocaleString('de-DE', { minimumFractionDigits: 2 });
                        }

                        function updatePrice() {
                            const selectedValues = variantOptionSelectors.map(selector =>
                                document.querySelector(selector)?.value || null
                            );
                            let currentVariant = null;
                            if (variants.length === 1) {
                                currentVariant = variants[0];
                            } else {
                                currentVariant = variants.find(variant =>
                                    (!variant.optionValue1 || variant.optionValue1 === selectedValues[0])
                                        && (!variant.optionValue2 || variant.optionValue2 === selectedValues[1])
                                        && (!variant.optionValue3 || variant.optionValue3 === selectedValues[2])
                                    );
                            }

                            if (currentVariant) {
                                originalPriceElem.textContent = formatPrice(currentVariant.originalPriceInCents);
                                promoPriceElem.textContent = formatPrice(currentVariant.promotionalPriceInCents);
                                if (currentVariant.isAvailable) {
                                    pricesContainer.style.display = 'block';
                                    addToCartButton.disabled = false;
                                    addToCartButton.value = addToCartText;
                                } else {
                                    pricesContainer.style.display = 'none';
                                    addToCartButton.disabled = true;
                                    addToCartButton.value = notAvailableText;
                                }
                            } else {
                                originalPriceElem.textContent = '';
                                promoPriceElem.textContent = '';
                                pricesContainer.style.display = 'none';
                                addToCartButton.disabled = true;
                                addToCartButton.value = notAvailableText;
                            }
                        }

                        variantOptionSelectors.forEach(selector => {
                            const selectElem = document.querySelector(selector);
                            if (selectElem) {
                                selectElem.addEventListener('change', updatePrice);
                            }
                        });

                        function selectFirstAvailableVariant() {
                            const firstAvailable = variants.find(v => v.isAvailable);
                            const select1 = crossSellingContainer.querySelector('#js-cross-selling-option-value-1');
                            const select2 = crossSellingContainer.querySelector('#js-cross-selling-option-value-2');
                            const select3 = crossSellingContainer.querySelector('#js-cross-selling-option-value-3');
                            if (select1 && firstAvailable.optionValue1) {
                                select1.value = firstAvailable.optionValue1;
                            }
                            if (select2 && firstAvailable.optionValue2) {
                                select2.value = firstAvailable.optionValue2;
                            }
                            if (select3 && firstAvailable.optionValue3) {
                                select3.value = firstAvailable.optionValue3;
                            }
                        }

                        selectFirstAvailableVariant();

                        updatePrice();
                    }

                    {# Update shipping input zipcode on add to cart #}

                    {# Use zipcode from input if user is in product page, or use zipcode cookie if is not #}

                    if (jQueryNuvem("#product-shipping-container .js-shipping-input").val()) {
                        zipcode_on_addtocart = jQueryNuvem("#product-shipping-container .js-shipping-input").val();
                        jQueryNuvem("#cart-shipping-container .js-shipping-input").val(zipcode_on_addtocart);
                        jQueryNuvem(".js-shipping-calculator-current-zip").text(zipcode_on_addtocart);
                    } else if (cookieService.get('calculator_zipcode')){
                        var zipcode_from_cookie = cookieService.get('calculator_zipcode');
                        jQueryNuvem('.js-shipping-input').val(zipcode_from_cookie);
                        jQueryNuvem(".js-shipping-calculator-current-zip").text(zipcode_from_cookie);
                    }
                }
                var callback_error = function(){

                    {# Restore real button visibility in case of error #}

                    $productButtonPlaceholder.removeClass("active");
                    $productButtonText.fadeIn("active");
                    $productButtonAdding.removeClass("active");
                    $productButtonPlaceholder.hide();
                    $productButton.css('display' , 'inline-block');
                }
                $prod_form = jQueryNuvem(this).closest("form");
                LS.addToCartEnhanced(
                    $prod_form,
                    '{{ "Agregar al carrito" | translate }}',
                    '{{ "Agregando..." | translate }}',
                    '{{ "¡Uy! No tenemos más stock de este producto para agregarlo al carrito." | translate }}',
                    {{ store.editable_ajax_cart_enabled ? 'true' : 'false' }},
                        callback_add_to_cart,
                        callback_error
                );
            {% endif %}
        }
    });

    
    jQueryNuvem(document).on("submit", ".js-product-container form", function (e) {
        {% if settings.ajax_cart %}
            e.preventDefault();
        {% endif %}

        var $form = jQueryNuvem(this);
        var $btn  = $form.find(".js-addtocart:not(.js-addtocart-placeholder)").first();

        // Si encontramos el botón real de agregar al carrito, disparamos el mismo handler
        if ($btn.length) {
            $btn.trigger("click");
        }
    });
    // jQueryNuvem(document).on("submit", ".custom-quickshop-2-content .js-addtocart", function (e) {
    //     e.preventDefault();
    // });


    {# /* // Cart quantitiy changes */ #}

    jQueryNuvem(document).on("keypress", ".js-cart-quantity-input", function (e) {
        if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
            return false;
        }
    });

    jQueryNuvem(document).on("focusout", ".js-cart-quantity-input", function (e) {
        var itemID = jQueryNuvem(this).attr("data-item-id");
        var itemVAL = jQueryNuvem(this).val();
        if (itemVAL == 0) {
            var r = confirm("{{ '¿Seguro que quieres borrar este artículo?' | translate }}");
            if (r == true) {
                LS.removeItem(itemID, true);
            } else {
                jQueryNuvem(this).val(1);
            }
        } else {
            LS.changeQuantity(itemID, itemVAL, true);
        }
    });

    {# /* // Empty cart alert */ #}

    jQueryNuvem(".js-trigger-empty-cart-alert").on("click", function (e) {
        e.preventDefault();
        let emptyCartAlert = jQueryNuvem(".js-mobile-nav-empty-cart-alert").fadeIn(100);
        setTimeout(() => emptyCartAlert.fadeOut(500), 1500);
    });

    {# /* // Go to checkout */ #}

    {# Clear cart notification cookie after consumers continues to checkout #}

    jQueryNuvem('form[action="{{ store.cart_url | escape('js') }}"]').on("submit", function() {
        cookieService.remove('first_product_added_successfully');
    });