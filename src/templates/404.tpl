{# Only remove this if you want to take away the theme onboarding advices ##}
{% set show_help = not has_products %}

{# Here we will add an example as a help, you can delete this after you upload your products #}

{% if show_help %}
	<div id="product-example">
		{% snipplet 'defaults/show_help_product.tpl' %}
	</div>
{% else %}
	{% embed "snipplets/page-header.tpl" %}
		{% block page_header_text %}{{ "Error" | translate }} - {{ "404" | translate }}{% endblock page_header_text %}
	{% endembed %}

	<section id="404">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12 text-center">
					<p class="mb-1">{{ "La página que estás buscando no existe." | translate }}</p></br>
				</div>
			</div>
			{% set related_products = sections.primary.products | take(4) | shuffle %}
			{% if related_products | length > 1 %}
				<div class="row">
					<div class="col-12 text-center">
						{{ "Quizás te interesen los siguientes productos." | translate }}
					</div>
				</div>
				<div class="row mx-0 mt-3 w-100">
					{% include 'snipplets/components/product/featured-products.tpl' with { section_list: sections.primary } %}
				</div>
			{% endif %}
		</div>
	</section>
{% endif %}
