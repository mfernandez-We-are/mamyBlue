<div class="js-product-variants{% if quickshop %} js-product-quickshop-variants text-left{% endif %} row mx-0">
	{% set has_size_variations = false %}
	{% set color_variant = '' %}
	{% for variation in product.variations %}
		{% set gender_variant_select = (variation.name|lower not in 'género' or (variation.name|lower in 'género' and variation.options|length > 1)) %}
			{% if variation.name in ['Color', 'Cor'] %}
				{% set color_variant = 'js-color-variants-container' %}
			{% endif %}
			<div class="{% if not gender_variant_select %}d-none{% endif %} js-product-variants-group {% if variation.name in ['Color', 'Cor'] %} order-last {% endif %} row align-items-center px-0 mx-0 {% if settings.bullet_variants %}col-12 col-md-10 mb-4 text-center {% if not quickshop %}text-md-left{% endif %}{% else %}{% if loop.length == 3 %} {% if quickshop %}col-4{% else %}col-12{% endif %} col-md-4 {% elseif loop.length == 2 %} col-6 {% else %} col {% if quickshop %}col-md-12{% else %}col-md-6{% endif %}{% endif %}{% endif %}">
				{% if gender_variant_select %}
					<div class="text-left {% if not quickshop %}text-md-left col-12 mb-2 pl-0{% endif %}">
						<label class="mb-3 h3">
							<span class="font-weight-bold">{{ variation.name }}</span>
						</label>
					</div>
				{% endif %}

				{% embed "snipplets/components/forms/form-select.tpl" with{select_label: true, select_label_name: '' ~ variation.name ~ '', select_for: 'variation_' ~ loop.index , select_id: 'variation_' ~ loop.index, select_data_value: 'variation_' ~ loop.index, select_name: 'variation' ~ '[' ~ variation.id ~ ']', select_group_custom_class:'d-none', select_custom_class: 'js-variation-option js-refresh-installment-data'} %}
					{% block select_options %}
						{% for option in variation.options %}
							<option value="{{ option.id }}" {% if product.default_options[variation.id] is same as(option.id) %} selected {% endif %}>{{ option.name }}</option>
						{% endfor %}
					{% endblock  select_options %}
				{% endembed %}
				
				{% if gender_variant_select %}
					{% embed "snipplets/components/forms/custom-form-select.tpl" with {
						select_label: false,
						select_group_custom_class: 'col-8 px-0 mb-0',
						select_id: "product-variant-"~ variation.name,
						select_name: variation.name,
						select_placeholder: product.default_options[variation.id],
						select_modifiers: "c-select--sm",
						select_custom_class: "row mx-0 align-items-center",
						text_custom_class: "col text-center",
					} %}
						{% block select_options %}
							{% for option in variation.options %}
								<a class="custom-select-option js-insta-variant {% if product.default_options[variation.id] is same as(option.id) %} is-selected{% endif %}" title="{{ option.name }}" data-option="{{ option.id }}" data-variation-id="{{ variation.id }}">
									<span class="btn-variant-content m-0 p-2" data-name="{{ option.name }}">{{ option.name }}</span>
								</a>
							{% endfor %}
						{% endblock %}
					{% endembed %}
				{% endif %}
			</div>
	{% endfor %}
</div>
