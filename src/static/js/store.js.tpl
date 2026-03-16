{#/*============================================================================
    #Specific store JS functions: product variants, cart, shipping, etc
==============================================================================*/#}
//nico-test
{#/*============================================================================
  
    Table of Contents

    #Lazy load
    #Notificactions
    #Modals
    #Tabs
    #Header and nav
        // Nav
        // Search suggestions
    #Sliders
        // Home slider
        // Banner services slider
    #Social
        // Youtube or Vimeo video
        // Facebook login
    #Product grid
        // Filters
        // Sort by
        // Infinite scroll
    #Product detail functions
        // Installments
        // Change Variant
        // Product labels on variant change
        // Color and size variants change
        // Custom mobile variants change
        // Submit to contact
        // Product slider
        // Pinterest sharing
        // Product quantity
    #Cart
        // Toggle cart 
        // Add to cart
        // Cart quantitiy changes
        // Empty cart alert
        // Go to checkout
    #Shipping calculator
        // Free shipping bar
        // Select and save shipping function
        // Calculate shipping function
        // Calculate shipping by submit
        // Shipping and branch click
        // Select shipping first option on results
        // Toggle branches link
        // Toggle more shipping options
        // Calculate shipping on page load
        // Shipping provinces
        // Change store country
    #Forms
    #Footer
    #Empty placeholders

==============================================================================*/#}

// Move to our_content
window.urls = {
    "shippingUrl": "{{ store.shipping_calculator_url | escape('js') }}"
}

{#/*============================================================================
  #Lazy load
==============================================================================*/ #}

document.addEventListener('lazybeforeunveil', function(e){
    if ((e.target.parentElement) && (e.target.nextElementSibling)) {
        var parent = e.target.parentElement;
        var sibling = e.target.nextElementSibling;
        if (sibling.classList.contains('js-lazy-loading-preloader')) {
            sibling.style.display = 'none';
            parent.style.display = 'block';
        }
    }
});


window.lazySizesConfig = window.lazySizesConfig || {};
lazySizesConfig.hFac = 0.4;


DOMContentLoaded.addEventOrExecute(() => {

	
	{# #Notifications #}
    {% include 'static/js/global/notifications.js.tpl' %}
	
    
    {# #Modals #}
    {% include 'static/js/global/modals.js.tpl' %}
    
    
    {# #Tabs #}
    {% include 'static/js/global/tabs.js.tpl' %}


    {#   #Header and nav #}
    {% include 'static/js/global/header.js.tpl' %}

	{# Sliders #}
    {% include 'static/js/global/sliders.js.tpl' %}

	{# #Socials #}
    {% include 'static/js/global/social.js.tpl' %}
	
    {# #Grid #}
    {% include 'static/js/grid/grid.js.tpl' %}

    {# Product Detail #}
    {% include 'static/js/product/product.js.tpl' %}

	{# #Cart #}
    {% include 'static/js/global/cart.js.tpl' %}
	
    {# #Shipping #}
    {% include 'static/js/global/shipping.js.tpl' %}

    {# #Forms #}
    {% include 'static/js/global/form.js.tpl' %}


    {# #Placeholders #}
    {% include 'static/js/global/placeholders.js.tpl' %}

    {#  #Footer #}
    {% include 'static/js/global/footer.js.tpl' %}


});
