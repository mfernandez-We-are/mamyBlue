{# snipplets/grid/item/actions.tpl #}

{# =========================
   FLAGS / DETECCIONES
========================= #}

{% set has_variants = product.variations is defined and product.variations|length > 0 %}

{% set has_size_variant = false %}
	{% if has_variants %}
		{% for v in product.variations %}
			{% if v.name in ['Talle', 'Talla', 'Tamanho', 'Size'] %}
		{% set has_size_variant = true %}
	{% endif %}
{% endfor %}
{% endif %}

{% set case_quickshop = has_variants and has_size_variant %}
{% set case_variants_no_size = has_variants and not has_size_variant %}
{% set case_simple = not has_variants %}

	<div class="item-actions-row d-flex justify-content-between"> <div class="item-actions mt-2">
		{% if product.variations %}

			{# Open quickshop popup if has variants #}

			<a data-toggle="#quickshop-modal" data-modal-url="modal-fullscreen-quickshop" class="js-quickshop-modal-open {% if slide_item %}js-quickshop-slide{% endif %} js-modal-open js-fullscreen-modal-open btn btn-primary btn-small px-4" title="{{ 'Compra rápida de' | translate }} {{ product.name }}" aria-label="{{ 'Compra rápida de' | translate }} {{ product.name }}" data-component="product-list-item.add-to-cart" data-component-value="{{product.id}}">{{ 'Agregar al carrito' | translate }}</a>
		{% else %}

			{# If not variants add directly to cart #}
			<form class="js-product-form" method="post" action="{{ store.cart_url }}">
				<input type="hidden" name="add_to_cart" value="{{product.id}}"/>
				{% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
				{% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}

				<input type="number" name="quantity" value="1" class="js-quantity-input hidden" aria-label="{{ 'Cambiar cantidad' | translate }}">

				<input
				type="submit" class="js-addtocart js-prod-submit-form btn btn-primary btn-small {{ state }} px-4 mb-1 mx-auto" value="{{ texts[state] | translate }}" {% if state == 'nostock' %} disabled {% endif %} data-component="product-list-item.add-to-cart" data-component-value="{{ product.id }}"/>

				{# Fake add to cart CTA visible during add to cart event #}
				{% include 'snipplets/components/placeholders/button-placeholder.tpl' with {custom_class: "js-addtocart-placeholder-inline btn-small mb-1 mx-auto"} %}

			</form>
		{% endif %}
	</div>

	<div class="item-actions-colors d-flex align-items-center mr-0 mr-md-1">
		{% include 'snipplets/grid/item-colors.tpl' %}
	</div>

</div>
