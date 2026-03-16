{% if product.description is not empty %}
	<h3 class="subtitle h3 mb-1">{{ "Descripción" | translate }}</h3>
	<div class="js-accordion-expand-container description-container w-100 mb-3">
		<div class="js-accordion-content w-100 pt-3">
			<div class="product-description user-content order-description mb-4">
				{{ product.description }}
			</div>
		</div>
		<a href="#" class="js-accordion-expand-toggle d-block row">
			<div class="col-auto font-smallest text-underline description-expand-text-toggle d-block mt-2">
				<span class="js-accordion-toggle-inactive">
					{% include "snipplets/svg/plus.tpl" with { svg_custom_class: "icon-inline icon-sm mr-2" } %}
					Desplegar mas info
				</span>
				<span class="js-accordion-toggle-active" style="display: none;">
					{% include "snipplets/svg/minus.tpl" with { svg_custom_class: "icon-inline icon-sm mr-2" } %}
					Desplegar menos info
				</span>
			</div>
		</a>
	</div>
{% endif %}
