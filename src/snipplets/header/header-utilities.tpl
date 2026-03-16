{% set hide_search_icon = hide_search_icon | default(false) %}

<div class="utilities-container mx-0">
  <div class="utilities-item">
		<a href="#" class="js-modal-open js-toggle-search head-text-color head-text-hover d-none d-md-block" data-toggle="#nav-search" aria-label="{{ 'Buscador' | translate }}">
			{% include "snipplets/svg/faq-circle.tpl" with {svg_custom_class: "icon-inline icon-w-16 head-text-color head-text-hover"} %}
		</a>
	</div>
	{% if not hide_search_icon %}

  <div class="utilities-item">
    <a href="#" class="js-modal-open js-toggle-search head-text-color head-text-hover"
       data-toggle="#nav-search" aria-label="{{ 'Buscador' | translate }}">
      {% include "snipplets/svg/search.tpl" with { svg_custom_class: "icon-inline icon-w-16 head-text-color head-text-hover" } %}
    </a>
  </div>
{% endif %}
	<div class="utilities-item" data-store="account-links">
		<a href="{{ customer ? store.customer_home_url : store.customer_register_url }}" class="head-text-color head-text-hover">
			<span class="h4">{% include "snipplets/svg/user.tpl" with {svg_custom_class: "icon-inline icon-w-16 head-text-color head-text-hover"} %}</span>
		</a>
	</div>
	{% if not store.is_catalog %}
		<div class="utilities-item">
  <div id="ajax-cart" class="cart-summary" data-component='cart-button'>
    <a {% if settings.ajax_cart and template != 'cart' %}
         href="#"
         class="js-modal-open js-fullscreen-modal-open js-toggle-cart head-text-color head-text-hover"
         data-toggle="#modal-cart" data-modal-url="modal-fullscreen-cart"
       {% else %}
         href="{{ store.cart_url }}"
       {% endif %}>
      {% include "snipplets/svg/shopping-bag.tpl" with {svg_custom_class: "icon-inline icon-w-14 head-text-color head-text-hover"} %}

      {# Mostrar la burbuja solo si hay items #}
      {% if (cart.items_count | default(0)) > 0 %}
        <span class="js-cart-widget-amount cart-widget-amount head-text-color head-text-hover">
          {{ cart.items_count }}
        </span>
      {% endif %}
    </a>
  </div>
</div>

	{% endif %}
</div>