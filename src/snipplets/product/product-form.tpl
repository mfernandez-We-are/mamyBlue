{# Product name and breadcrumbs #}
{% embed "snipplets/page-header.tpl" %}
	{% block page_header_text %}
		{{ product.name }}
	{% endblock page_header_text %}
{% endembed %}

{# brand and sku #}
<div class="product-brand mb-2">
	<span>{{product.brand}}</span>
</div>
{# <div class="product-sku mb-1">
	<span>{{product.sku}}</span>
</div> #}

{# Product price #}

{# Tomamos como precio unitario el de la variante seleccionada, o el del producto #}
{% set unit_price = product.selected_or_first_available_variant
    ? product.selected_or_first_available_variant.price
    : product.price
%}

<div class="price-container text-left" data-store="product-price-{{ product.id }}">

  {# PRECIO UNITARIO - IVA #}
  <div class="product-price-unit mb-2">
    <p class="text-uppercase precio-text mb-1">
      Precio unitario
    </p>
    <h4 class="h5 mb-0" id="unit_price_display">
      {{ unit_price | money | replace(',00','') }}
    </h4>
  </div>

  {# PRECIO TOTAL (se sigue usando js-price-display y price_display) #}
  <div class="product-price-total mb-2">
    <p class="text-uppercase precio-text mb-1">
      Precio total
    </p>
    <h4 class="h2 js-price-display mb-2"
        id="price_display"
        {% if not product.display_price %}style="display:none;"{% endif %}
        data-product-price="{{ unit_price }}">
      {% if product.display_price %}
        {{ unit_price | money | replace(',00','') }}
      {% endif %}
    </h4>
  </div>

  {# Descuentos por medio de pago (lo dejamos como estaba) #}
  {{ component('payment-discount-price', {
        visibility_condition: settings.payment_discount_price,
        location: 'product',
        container_classes: "h6 text-accent mb-3",
    })
  }}
</div>

{# Precio sin impuestos nacionales (ya lo tenías) #}
{% if product.price_without_taxes %}
  <span class="product-price-without-taxes mb-1">
    Precio sin impuestos nacionales {{ product.price_without_taxes | money }}
  </span>
{% endif %}


{# {{ component('promotions-details', {
    promotions_details_classes: {
        container: 'js-product-promo-container text-left mb-4',
        promotion_title: 'h4 mb-2 text-accent',
        valid_scopes: 'mb-0',
        categories_combinable: 'mb-0',
        not_combinable: 'font-small mb-0',
        progressive_discounts_table: 'table mb-2 mt-3',
        progressive_discounts_hidden_table: 'table-body-inverted',
        progressive_discounts_show_more_link: 'btn-link btn-link-primary mb-4',
        progressive_discounts_show_more_icon: 'icon-inline',
        progressive_discounts_hide_icon: 'icon-inline icon-flip-vertical',
        progressive_discounts_promotion_quantity: 'font-weight-light text-lowercase'
    },
    svg_sprites: false,
    custom_control_show: include("snipplets/svg/chevron-down.tpl", { svg_custom_class: "icon-inline icon-w-14 icon-md ml-2" }),
    custom_control_hide: include("snipplets/svg/chevron-up.tpl", { svg_custom_class: "icon-inline icon-w-14 icon-md ml-2" }),
}) }} #}
{% set cuotas_personalizado_product = settings.cuotas_personalizado_product %}
{% if cuotas_personalizado_product %}
 <span class="d-flex product-installments-overview mb-1">
    {{cuotas_personalizado_product}}
  </span>
{% endif %}
{# Product installments #}

{% set installments_info = product.installments_info_from_any_variant %}
{% set hasDiscount = product.maxPaymentDiscount.value > 0 %}
{% set show_payments_info = product.show_installments and product.display_price and installments_info %}
{% set mostrar_cuotas_default = settings.mostrar_cuotas_default | default(false) %}

{% if mostrar_cuotas_default %}

	<div
		data-modal-url="modal-fullscreen-payments" class="product-installments-overview mb-4" {% if not (product.get_max_installments and product.get_max_installments(false)) %} style="display: none;" {% endif %}>
		{# Installments #}
		{% if show_payments_info %}
			{% set max_installments_without_interests = product.get_max_installments(false) %}
			{% set installments_without_interests = max_installments_without_interests and max_installments_without_interests.installment > 1 %}
			{% set installment_text_weigth = installments_without_interests ? 'font-weight-bold' : '' %}
			{{ component('installments', {'location' : 'product_detail', container_classes: { installment: "product-detail-installments text-left mb-2 "}}) }}
		{% endif %}

		{% include 'snipplets/product/product-price-cash.tpl' with { container_class: 'js-product-discount-container text-left mb-2' } %}
	</div>
{% endif %}

{# Product availability #}
{% set show_product_quantity = product.available and product.display_price %}

{# Free shipping minimum message #}

{% set has_free_shipping = cart.free_shipping.cart_has_free_shipping or cart.free_shipping.min_price_free_shipping.min_price %}
{% set has_product_free_shipping = product.free_shipping %}

{% set size_guide_type = "" %}
{% for tag in product.tags %}
	{% set tag_split = tag | split("talles:") %}
	{% if tag_split.1 %}
		{% set size_guide_type = tag_split.1 %}
	{% endif %}
{% endfor %}

{% set has_size_guide = size_guide_type in ["guia-de-talles-remeras", "guia-de-talles-ojotas",] %}

{# Product description #}
{% include "snipplets/product/product-description.tpl" %}


{# Product form, includes: Variants, CTA and Shipping calculator #}
<form id="product_form" class="js-product-form" method="post" action="{{ store.cart_url }}" data-store="product-form-{{ product.id }}">
	<input type="hidden" name="add_to_cart" value="{{product.id}}"/>
	{% if product.variations %}
		{% include "snipplets/product/product-variants-with-select.tpl" %}
	{% endif %}

	{% if has_size_guide %}
	
	{% if settings.size_guide_url %}
		<div class="px-0 col-12 my-4 text-left">
			<a data-toggle="#size-guide-modal" data-modal-url="modal-fullscreen-size-guide" class="js-modal-open js-fullscreen-modal-open font-big font-weight-bold">
				{% include "snipplets/svg/ruler.tpl" with {svg_custom_class: "icon-inline icon-lg mr-1"} %}
				{{ 'Guía de talles' | translate }}
			</a>
		</div>
		{% embed "snipplets/modal.tpl" with{modal_id: 'size-guide-modal', modal_class: 'video-item', modal_position: 'bottom', modal_transition: 'slide', modal_header: true, modal_footer: true, modal_width: 'centered', modal_mobile_full_screen: 'true'} %}
			{% block modal_head %}
				{{ 'Guía de talles' | translate }}
			{% endblock %}
			{% block modal_body %}
				{% include 'snipplets/product/product-size-guide.tpl' %}
			{% endblock %}
		{% endembed %}
	{% endif %}
	{% endif %}

	<div class="row">
		{% if product.available and product.display_price %}
			{% include "snipplets/product/product-quantity.tpl" %}
		{% endif %}
		{% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
		{% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}

		{# Add to cart CTA #}
		<div class="col-6 col-md-7 mb-3">
			<input
			type="submit" class="product-add-to-cart js-addtocart js-prod-submit-form btn btn-agregar-carrito font-weight-bold btn-block mb-2 {{ state }}" value="{{ texts[state] | translate }}" {% if state == 'nostock' %} disabled {% endif %} data-store="product-buy-button" data-component="product.add-to-cart"/>
			{# Fake add to cart CTA visible during add to cart event #}
			{# {% include 'snipplets/components/placeholders/button-placeholder.tpl' with {custom_class: "btn-block mb-4"} %} #}
			<div class="js-added-to-cart-product-message float-leftt w-100 mb-3 text-left" style="display: none;">
				{{'Ya agregaste este producto.' | translate }}<a href="#" class="js-modal-open js-fullscreen-modal-open btn btn-link ml-1" data-toggle="#modal-cart" data-modal-url="modal-fullscreen-cart">{{ 'Ver carrito' | translate }}</a>
			</div>
		</div>
	</div>

	{# If product detail installments, include container with "see installments" link #}
	<div class="js-accordion-container w-100 mb-3">
		<a href="#" class="js-accordion-toggle py-1 row">
			<div class="col font-weight-bold">
				{% include "snipplets/svg/credit-card-blank.tpl" with { svg_custom_class: "icon-inline icon-lg mr-2" } %}
				<span class="subtitle font-big">{{ 'Medios de pago' | translate }}</span>
			</div>
			<div class="col-auto">
				<span class="js-accordion-toggle-inactive">
					{% include "snipplets/svg/chevron-right.tpl" with { svg_custom_class: "icon-inline icon-lg mr-2" } %}
				</span>
				<span class="js-accordion-toggle-active" style="display: none;">
					{% include "snipplets/svg/chevron-down.tpl" with { svg_custom_class: "icon-inline icon-lg mr-2" } %}
				</span>
			</div>
		</a>
		<div class="js-accordion-content w-100 pt-3" style="display: none;">
			<div
				{% if installments_info %} data-toggle="#installments-modal" data-modal-url="modal-fullscreen-payments" {% endif %} class="{% if installments_info %}js-modal-open js-fullscreen-modal-open{% endif %} js-product-payments-container row mb-4" {% if not (product.get_max_installments and product.get_max_installments(false)) %} style="display: none;" {% endif %}>

				{# Installments #}
				{% if show_payments_info %}
					{% set max_installments_without_interests = product.get_max_installments(false) %}
					{% set installments_without_interests = max_installments_without_interests and max_installments_without_interests.installment > 1 %}
					{% set installment_text_color = installments_without_interests ? 'text-accent' : '' %}
					{{ component('installments', {'location' : 'product_detail', container_classes: { installment: "col-12 mb-2 " ~ installment_text_color}}) }}
				{% endif %}

				{# Max Payment Discount #}
				{% set hideDiscountContainer = not (hasDiscount and product.showMaxPaymentDiscount) %}
				{% set hideDiscountDisclaimer = not product.showMaxPaymentDiscountNotCombinableDisclaimer %}

				<span class="js-product-discount-container col-12 mb-2" {% if hideDiscountContainer %} style="display: none;" {% endif %}>
					<span>{{ product.maxPaymentDiscount.value }}%
						{{'de descuento' | translate }}</span>
					{{'pagando con' | translate }}
					{{ product.maxPaymentDiscount.paymentProviderName }}
					<div class="js-product-discount-disclaimer font-small mt-1" {% if hideDiscountDisclaimer %} style="display: none;" {% endif %}>
						{{ "No acumulable con otras promociones" | translate }}
					</div>
				</span>

				<a id="btn-installments" class="font-small col mt-1" {% if not (product.get_max_installments and product.get_max_installments(false)) %} style="display: none;" {% endif %}>
					<span class="d-table">
						{% if not hasDiscount and not settings.product_detail_installments %}
							{% include "snipplets/svg/credit-card-blank.tpl" with { svg_custom_class: "icon-inline icon-lg mr-2" } %}
							{{ "Ver medios de pago" | translate }}
						{% else %}
							{{ "Ver más detalles" | translate }}
						{% endif %}
					</span>
				</a>
			</div>
		</div>
	</div>

	{# Define contitions to show shipping calculator and store branches on product page #}
	{% set show_product_fulfillment = settings.shipping_calculator_product_page and (store.has_shipping or store.branches) and not product.free_shipping and not product.is_non_shippable %}

	{% if show_product_fulfillment %}
		{# Shipping calculator and branch link #}
		<div
			class="js-accordion-container w-100 mb-3">

			{# 1) Toggle: lo que se ve antes de hacer clic #}
			<a href="#" class="js-accordion-toggle py-1 row">
				<div class="col font-weight-bold">
					{% include "snipplets/svg/truck.tpl" with { svg_custom_class: "icon-inline icon-lg mr-2" } %}
					<span class="subtitle font-big">{{ "Medios de Envío" | translate }}</span>
				</div>
				<div class="col-auto">
					<span class="js-accordion-toggle-inactive">
						{% include "snipplets/svg/chevron-right.tpl" with { svg_custom_class: "icon-inline icon-lg mr-2" } %}
					</span>
					<span class="js-accordion-toggle-active" style="display: none;">
						{% include "snipplets/svg/chevron-down.tpl" with { svg_custom_class: "icon-inline icon-lg mr-2" } %}
					</span>
				</div>
			</a>

			{# 2) Contenido oculto: va la descripción #}
			<div class="js-accordion-content w-100 pt-3" style="display: none;">
				<div
					id="product-shipping-container" class="product-shipping-calculator list" {% if not product.display_price or not product.has_stock %} style="display:none;" {% endif %} data-shipping-url="{{ store.shipping_calculator_url }}">
					{# Shipping Calculator #}
					{% if store.has_shipping %}
						{% include "snipplets/shipping/shipping-calculator.tpl" with {'shipping_calculator_variant' : product.selected_or_first_available_variant, 'product_detail': true} %}
					{% endif %}

					{% if store.branches %}
						{# Link for branches #}
						{% include "snipplets/shipping/branches.tpl" with {'product_detail': true} %}
					{% endif %}
				</div>
			</div>
		</div>
	{% endif %}

	{% set mostrar_boton_contacto = settings.mostrar_boton_contacto | default(false) %}
	{% if mostrar_boton_contacto %}
		<button
			type="button"
			class="btn btn-contactar-asesor btn-block"
			onclick="if (typeof crmPlugin === 'function') { crmPlugin('runChatShow'); }"
		>
			CONTACTAR ASESOR
		</button>
		{% endif %}
</form>

{# Product payments details #}

{% include 'snipplets/product/product-payment-details.tpl' %}
