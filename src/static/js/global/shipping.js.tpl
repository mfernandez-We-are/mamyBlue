{#/*============================================================================
	  #Shipping calculator
	==============================================================================*/ #}

	{# /* // Select and save shipping function */ #}

    selectShippingOption = function(elem, save_option) {
        jQueryNuvem(".js-shipping-method, .js-branch-method").removeClass('js-selected-shipping-method');
        jQueryNuvem(elem).addClass('js-selected-shipping-method');
        if (save_option) {
            LS.saveCalculatedShipping(true);
        }
        if(jQueryNuvem(elem).hasClass("js-shipping-method-hidden")){

            {# Toggle other options visibility depending if they are pickup or delivery for cart and product at the same time #}

            if(jQueryNuvem(elem).hasClass("js-pickup-option")){
                jQueryNuvem(".js-other-pickup-options, .js-show-other-pickup-options .js-shipping-see-less").show();
                jQueryNuvem(".js-show-other-pickup-options .js-shipping-see-more").hide();

            }else{
                jQueryNuvem(".js-other-shipping-options, .js-show-more-shipping-options .js-shipping-see-less").show();
                jQueryNuvem(".js-show-more-shipping-options .js-shipping-see-more").hide()
            }          
        }
    };

    {# Apply zipcode saved by cookie if there is no zipcode saved on cart from backend #}

    if (cookieService.get('calculator_zipcode')) {

        {# If there is a cookie saved based on previous calcualtion, add it to the shipping input to triggert automatic calculation #}

        var zipcode_from_cookie = cookieService.get('calculator_zipcode');
        
        {% if settings.ajax_cart %}

            {# If ajax cart is active, target only product input to avoid extra calulation on empty cart #}

            jQueryNuvem('#product-shipping-container .js-shipping-input').val(zipcode_from_cookie);

        {% else %}

            {# If ajax cart is inactive, target the only input present on screen #}

            jQueryNuvem('.js-shipping-input').val(zipcode_from_cookie);

        {% endif %}

        jQueryNuvem(".js-shipping-calculator-current-zip").text(zipcode_from_cookie);

        {# Hide the shipping calculator and show spinner  #}

        jQueryNuvem(".js-shipping-calculator-head").addClass("with-zip").removeClass("with-form");
        jQueryNuvem(".js-shipping-calculator-with-zipcode").addClass("transition-up-active");
        jQueryNuvem(".js-shipping-calculator-spinner").show();
    } else {

        {# If there is no cookie saved, show calcualtor #}

        jQueryNuvem(".js-shipping-calculator-form").addClass("transition-up-active");
    }           

    {# Remove shipping suboptions from DOM to avoid duplicated modals #}

    removeShippingSuboptions = function(){
        var shipping_suboptions_id = jQueryNuvem(".js-modal-shipping-suboptions").attr("id");
        jQueryNuvem("#" + shipping_suboptions_id).remove();
        jQueryNuvem('.js-modal-overlay[data-modal-id="#' + shipping_suboptions_id + '"').remove();
    };

    {# /* // Calculate shipping function */ #}

	jQueryNuvem(".js-calculate-shipping").on("click", function (e) {
        e.preventDefault();

        {# Take the Zip code to all shipping calculators on screen #}
        let shipping_input_val = jQueryNuvem(e.currentTarget).closest(".js-shipping-calculator-form").find(".js-shipping-input").val();

        jQueryNuvem(".js-shipping-input").val(shipping_input_val);

        {# Calculate on page load for both calculators: Product and Cart #}

        if (jQueryNuvem(".js-cart-item").length) {
            LS.calculateShippingAjax(
            jQueryNuvem('#cart-shipping-container').find(".js-shipping-input").val(),
            '{{store.shipping_calculator_url | escape('js')}}',
            jQueryNuvem("#cart-shipping-container").closest(".js-shipping-calculator-container") );
        }

        jQueryNuvem(".js-shipping-calculator-current-zip").html(shipping_input_val);
        removeShippingSuboptions();

    });

	{# /* // Calculate shipping by submit */ #}

	jQueryNuvem(".js-shipping-input").on('keydown', function (e) {
        var key = e.which ? e.which : e.keyCode;
        var enterKey = 13;
        if (key === enterKey) {
            e.preventDefault();
            jQueryNuvem(e.currentTarget).closest(".js-shipping-calculator-form").find(".js-calculate-shipping").trigger('click');
            if (window.innerWidth < 768) {
                jQueryNuvem(e.currentTarget).trigger('blur');
            }
        }
    });

    {# /* // Shipping and branch click */ #}

    jQueryNuvem(document).on("change", ".js-shipping-method, .js-branch-method", function (e) {
        selectShippingOption(this, true);
        jQueryNuvem(".js-shipping-method-unavailable").hide();
    });

    {# /* // Select shipping first option on results */ #}

    jQueryNuvem(document).on('shipping.options.checked', '.js-shipping-method', function (e) {
        let shippingPrice = jQueryNuvem(this).attr("data-price");
        LS.addToTotal(shippingPrice);

        let total = (LS.data.cart.total / 100) + parseFloat(shippingPrice);
        jQueryNuvem(".js-cart-widget-total").html(LS.formatToCurrency(total));

        selectShippingOption(this, false);
    });

    {# /* // Toggle branches link */ #}

    jQueryNuvem(document).on("click", ".js-toggle-branches", function (e) {
        e.preventDefault();
        jQueryNuvem(".js-store-branches-container").slideToggle("fast");
        jQueryNuvem(".js-see-branches, .js-hide-branches").toggle();
    });

    {# /* // Toggle more shipping options */ #}

    jQueryNuvem(document).on("click", ".js-toggle-more-shipping-options", function(e) {
        e.preventDefault();

        {# Toggle other options depending if they are pickup or delivery for cart and product at the same time #}

        if(jQueryNuvem(this).hasClass("js-show-other-pickup-options")){
            jQueryNuvem(".js-other-pickup-options").slideToggle(600);
            jQueryNuvem(".js-show-other-pickup-options .js-shipping-see-less, .js-show-other-pickup-options .js-shipping-see-more").toggle();
        }else{
            jQueryNuvem(".js-other-shipping-options").slideToggle(600);
            jQueryNuvem(".js-show-more-shipping-options .js-shipping-see-less, .js-show-more-shipping-options .js-shipping-see-more").toggle();
        }
    });

    {# /* // Calculate shipping on page load */ #}

    {# Only shipping input has value, cart has saved shipping and there is no branch selected #}

    calculateCartShippingOnLoad = function(){
        if(jQueryNuvem("#cart-shipping-container .js-shipping-input").val()){
       
            // If user already had calculated shipping: recalculate shipping

            setTimeout(function() { 
                LS.calculateShippingAjax(
                    jQueryNuvem('#cart-shipping-container').find(".js-shipping-input").val(),
                    '{{store.shipping_calculator_url | escape('js')}}',
                    jQueryNuvem("#cart-shipping-container").closest(".js-shipping-calculator-container") );
                    removeShippingSuboptions();
            }, 100);
        }

        if(jQueryNuvem(".js-branch-method").hasClass('js-selected-shipping-method')){
            {% if store.branches|length > 1 %}
                jQueryNuvem(".js-store-branches-container").slideDown("fast");
                jQueryNuvem(".js-see-branches").hide();
                jQueryNuvem(".js-hide-branches").show();
            {% endif %}
        }
    };
    
    {% if cart.has_shippable_products %}
        calculateCartShippingOnLoad();
    {% endif %}

    {# /* // Change CP */ #}

    jQueryNuvem(document).on("click", ".js-shipping-calculator-change-zipcode", function(e) {
        e.preventDefault();
        jQueryNuvem(".js-shipping-calculator-response").fadeOut(100);
        jQueryNuvem(".js-shipping-calculator-head").addClass("with-form").removeClass("with-zip");
        jQueryNuvem(".js-shipping-calculator-with-zipcode").removeClass("transition-up-active");
        jQueryNuvem(".js-shipping-calculator-form").addClass("transition-up-active");
    }); 

    {# /* // Shipping provinces */ #}

    {% if provinces_json %}
        jQueryNuvem('select[name="country"]').on("change", function (e) {
            var provinces = {{ provinces_json | default('{}') | raw }};
            LS.swapProvinces(provinces[jQueryNuvem(e.currentTarget).val()]);
        }).trigger('change');
    {% endif %}

    {# /* // Change store country: From invalid zipcode message */ #}

    jQueryNuvem(document).on("click", ".js-save-shipping-country", function(e) {

        e.preventDefault();

        {# Change shipping country #}

        lang_select_option = jQueryNuvem(this).closest(".js-modal-shipping-country");
        changeLang(lang_select_option);

        jQueryNuvem(this).text('{{ "Aplicando..." | translate }}').addClass("disabled");
    });