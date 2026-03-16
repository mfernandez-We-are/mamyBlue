{# snipplets/grid/item/quickshop-form.tpl
   Props esperados:
   - product
   - store
   - settings
   - item_state
   - item_state_texts
#}

<div class="js-item-variants hidden">
	<form class="js-product-form" method="post" action="{{ store.cart_url }}">
		<input type="hidden" name="add_to_cart" value="{{product.id}}"/>
		{% if product.variations %}
			{% include "snipplets/product/product-variants.tpl" with {quickshop: true} %}
		{% endif %}
		{% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
		{% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}

		{# Add to cart CTA #}
		{% set show_product_quantity = product.available and product.display_price %}
		<div class="row no-gutters mt-3">

			{% if show_product_quantity %}
				{% include "snipplets/product/product-quantity.tpl" with {quickshop: true} %}
			{% endif %}

			<div class="{% if show_product_quantity %}col-8 col-md-9{% else %}col-12{% endif %}">
				<input
				type="submit" class="js-addtocart js-prod-submit-form btn-add-to-cart btn btn-primary btn-big w-100 {{ state }}" value="{{ texts[state] | translate }}" {% if state == 'nostock' %} disabled {% endif %}/>
				{# Fake add to cart CTA visible during add to cart event #}
				{% include 'snipplets/components/placeholders/button-placeholder.tpl' with {custom_class: "btn-big"} %}
			</div>
		</div>
	</form>
</div>
