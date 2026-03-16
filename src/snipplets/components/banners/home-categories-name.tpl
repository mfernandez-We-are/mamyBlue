{% for category in categories %}
	{% if category.handle == category_handle %}
		{% set category_name = category.name %}
		<div class="category-name text-center align-top text-transform">
			<span class="category-name-text">{{ category_custom_name ? category_custom_name: category_name }}</span>
			{% if category_custom_description %}
				<br>
				<span class="category-description-text">{{ category_custom_description }}</span>
			{% endif %}
		</div>
	{% endif %}
	{% include 'snipplets/components/banners/home-categories-name.tpl' with { 'categories' : category.subcategories, 'category_custom_name': category_custom_name, 'category_custom_description': category_custom_description } %}
{% endfor %}
