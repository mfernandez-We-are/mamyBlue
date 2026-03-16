{# Componente de Guía de Talles con imagen fija según el tag #}

{% set size_guide_type = "" %}
{% for tag in product.tags %}
	{% set tag_split = tag | split("talles:") %}
	{% if tag_split.1 %}
		{% set size_guide_type = tag_split.1 %}
	{% endif %}
{% endfor %}

{% set has_size_guide = size_guide_type in ["guia-de-talles-remeras", "guia-de-talles-ojotas",] %}
<div class="{% if not has_size_guide %}mt-2 mt-md-0{% endif %} px-md-3 pb-md-4" data-store="product-size-guide-{{ product.id }}">
	{% if size_guide_type == "guia-de-talles-remeras" %}
		{% if 'size_guide_shirts.png' | has_custom_image %}
			<div class="user-content font-medium text-center">
				<img src="{{'size_guide_shirts.png' | static_url }}" alt="Guía de talles hombre" style="max-width: 100%; height: auto;" loading="lazy"/>
			</div>
		{% endif %}
	{% elseif size_guide_type == "guia-de-talles-ojotas" %}
		{% if 'size_guide_slippers.png' | has_custom_image %}
			<div class="user-content font-medium text-center">
				<img src="{{'size_guide_slippers.png' | static_url }}" alt="Guía de talles hombre" style="max-width: 100%; height: auto;" loading="lazy"/>
			</div>
		{% endif %}
	{% else %}
		<div class="text-center font-medium mt-3">
			Guía de talles no disponible para este producto.
		</div>
	{% endif %}
</div>
 