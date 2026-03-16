{# snipplets/grid/item/image.tpl
   Props esperados:
   - product
   - product_url
   - has_color_variant
   - reduced_item
   - settings
#}

{# ====================== SELECCIÓN DE IMAGEN INICIAL ======================
Si hay variante de color destacada usa su imagen; sino la del producto.
Calcula el porcentaje de padding para mantener relación de aspecto (LQIP).
========================================================================== #}

{% if has_color_variant and product.featured_variant_image %}
  {% set item_img_width  = product.featured_variant_image.dimensions['width'] %}
  {% set item_img_height = product.featured_variant_image.dimensions['height'] %}
  {% set item_img_srcset = product.featured_variant_image %}
  {% set item_img_alt    = product.featured_variant_image.alt %}
{% else %}
  {% set item_img_width  = product.featured_image.dimensions['width'] %}
  {% set item_img_height = product.featured_image.dimensions['height'] %}
  {% set item_img_srcset = product.featured_image %}
  {% set item_img_alt    = product.featured_image.alt %}
{% endif %}

{% set item_img_spacing = item_img_height / item_img_width * 100 %}
{% set show_secondary_image = true and product.other_images %}
{% set secondary_image_src = show_secondary_image ? (product.other_images | first) : false %}


{# ============================ BLOQUE DE IMAGEN ============================
Imagen responsive con lazyload, placeholder fade y labels.
Si hay setting de color_variants, incluye labels con soporte de color.
============================================================================ #}

<div class="{% if show_secondary_image %}js-item-with-secondary-image item-with-two-images{% endif %} item-image mb-1">
	<div style="padding-bottom: {{ item_img_spacing }}%;" class="p-relative" data-store="product-item-image-{{ product.id }}">
		<a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}">
			<img alt="{{ item_img_alt }}" data-expand="-10" src="{{ 'images/empty-placeholder.png' | static_url }}" data-srcset="{{ item_img_srcset | product_image_url('small')}} 240w, {{ item_img_srcset | product_image_url('medium')}} 320w, {{ item_img_srcset | product_image_url('large')}} 480w" class="js-item-image lazyload img-absolute img-absolute-centered fade-in item-image-primary" width="{{ item_img_width }}" height="{{ item_img_height }}"/>
			<div class="placeholder-fade"></div>
			{% if show_secondary_image %}
				<img alt="{{ item_img_alt }}" src="{{ 'images/empty-placeholder.png' | static_url }}" data-srcset="{{ secondary_image_src | product_image_url('small')}} 240w, {{ secondary_image_src | product_image_url('medium')}} 320w, {{ secondary_image_src | product_image_url('large')}} 480w" class="js-item-image js-item-image-secondary lazyload img-absolute img-absolute-centered fade-in item-image-secondary"/>
			{% endif %}
		</a>

		{% if not reduced_item %}
			{% if settings.product_color_variants %}
				{% include 'snipplets/components/assets/labels.tpl' with { color: true } %}
			{% else %}
				{% include 'snipplets/components/assets/labels.tpl' %}
			{% endif %}
		{% endif %}
	</div>
</div>