{% paginate by 12 %}

	{% embed "snipplets/page-header.tpl" with { breadcrumbs: false } %}
		{% block page_header_text %}
			{{ "Resultados de búsqueda" | translate }}
		{% endblock page_header_text %}
	{% endembed %}
	
	<section class="category-body">
		<div class="container-fluid">
			<div class="js-category-controls row align-items-center mb-md-3 category-controls">
				<div class="col">
					<div class="breadcrumbs text-left">
						<a class="crumb" href="{{ store.url }}" title="{{ store.name }}">{{ "Inicio" | translate }}</a>
					</div>
				</div>
				{% if products %}
					<div class="d-none d-md-flex row mx-0">
						{% include "snipplets/grid/filters.tpl" with {applied_filters: true} %}
						{% include 'snipplets/grid/filters-modals.tpl' %}
					</div>
					<div class="col-12 d-md-none row mx-0">
						{% include 'snipplets/grid/filters-modals.tpl' with { mobile: true } %}
						{% include "snipplets/grid/filters.tpl" with {applied_filters: true} %}
					</div>
				{% endif %}
			</div>
			{% if products %}
				<div class="js-product-table row product-table justify-content-center no-gutters col-12">
					{% include 'snipplets/product_grid.tpl' %}
				</div>
				{% include 'snipplets/grid/pagination.tpl' with { infinite_scroll: true } %}
			{% else %}
				<p class="text-center">
					{{ "No hubo resultados para tu búsqueda" | translate }}
				</p>
			{% endif %}
		</div>
	</section>
