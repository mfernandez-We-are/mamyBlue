{% set image_sizes = ['small', 'large', 'huge', 'original', '1080p'] %}
{% set category_images = [] %}
{% set current_category = current_category | default(category) %}
{% set subcategory_nav = subcategory_nav | default(false) %}
{% set has_category_images = current_category.images is not empty %}

{% if has_category_images %}
	{% for size in image_sizes %}
		{# Define images for admin categories #}
		{% set category_images = category_images|merge({(size):(current_category.images | first | category_image_url(size))}) %}
	{% endfor %}
	<section class="{% if subcategory_nav %}subcategory-nav {% else %}category-banner {% endif %}position-relative mb-2" data-store="category-banner">
		<img class="lazyautosizes lazyload blur-up position-relative w-100" src="{{ category_images.small }}" data-srcset="{{ category_images.large }} 480w, {{ category_images.huge }} 640w, {{ category_images.original }} 1024w, {{ category_images['1080p'] }} 1920w" data-sizes="auto" alt="{{ 'Banner de la categoría' | translate }} {{ current_category.name }}"/>
	</section>
{% else %}
    {% if current_category.parent %}
	    {% include 'snipplets/components/banners/category-banner.tpl' with { current_category: current_category.parent } %}
    {% endif %}
{% endif %}
