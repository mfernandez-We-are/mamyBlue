{% if product.compare_at_price > product.price %}
    {% set price_discount_percentage = ((product.compare_at_price) - (product.price)) * 100 / (product.compare_at_price) %}
{% endif %}

{% if product.compare_at_price or product.promotional_offer %}
	{% if product.promotional_offer.script.is_percentage_off and (product.promotional_offer.parameters.percent * 100) != 0 %}
		<span class="js-offer-label standalone-product-discount-label" >{{ product.promotional_offer.parameters.percent * 100 }}% OFF</span>
	{% elseif price_discount_percentage|round != 0 %}
		{{price_discount_percentage|round}}
		<span class="js-offer-percentage standalone-product-discount-label">{{ price_discount_percentage|round }}% OFF</span>
	{% endif %}
{% endif %}
