{# /*============================================================================
  #Page header
==============================================================================*/

#Properties

#Title

#Breadcrumbs 
#}

<section class="page-header {% if template == 'product' %}mb-2 {% else %}mt-5{% endif %}" {% if template != 'product' %} data-store="page-title" {% endif %}>
	{% if template != 'product' %}
		<div class="{% if template == 'page' or 'account' in template %} container-fluid{% else %}container{% endif %}">
			<div class="row px-2">
			{% endif %}
			{% if template != 'product' %}
				{% if template == 'page' or 'account' in template %}
					<div class="col-12 {% if " locales" not in page.name %}{% endif %}">
					{% endif %}

					{% include 'snipplets/components/assets/breadcrumbs.tpl' %}

					{% if template == 'page' or 'account' in template %}
					</div>
				{% endif %}
			{% endif %}
			<div class="{% if template != 'product' or (template == 'page' and "Locales" not in page.name) or 'account' in template %}col {% elseif template == 'page' and "Locales" in page.name %}col-12{% endif %} {% if template == 'category' %}col-lg-6 offset-lg-3{% endif %}">
				<h1 {% if template == 'product' %} class="js-product-name h2" data-store="product-name-{{ product.id }}" {% endif %}> {% block page_header_text %}{% endblock %}
					</h1>
					{% if template == 'category' and category.description %}
						<p class="page-header-text font-md-normal">{{ category.description }}</p>
						<div class="divider col-2 offset-5 background-primary"></div>
					{% endif %}
				</div>

				{% if template != 'product' %}
				</div>
			</div>
		{% endif %}
	</section>
