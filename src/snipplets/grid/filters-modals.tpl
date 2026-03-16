{% set mobile = mobile | default(false) %}
{% set modal_id_val = mobile ? 'nav-filters-mobile':'nav-filters' %}
<div class="visible-when-content-ready pl-0 col-auto">
	{% if products %}
		<a href="#" class="js-modal-open js-fullscreen-modal-open btn btn-medium" data-toggle="#{{modal_id_val}}" data-modal-url="modal-fullscreen-filters" data-component="filter-button">
			<div class="custom-filters-button d-flex justify-content-center align-items-center px-2">
				{% include 'snipplets/svg/filter.tpl' with { svg_custom_class: "icon-inline icon-xl mr-2"} %}
				{{ 'Filtrar' | t }}
				{% if has_applied_filters %}{% endif %}
			</div>
		</a>
	{% endif %}
	{% embed "snipplets/modal.tpl" with{modal_id: modal_id_val, modal_class: 'filters', modal_position: 'left', modal_position_desktop: right, modal_transition: 'slide', modal_header_title: true, modal_width: 'docked-md', modal_mobile_full_screen: 'true' } %}
		{% block modal_head %}
			{{'Filtrar ' | translate }}
		{% endblock %}
		{% block modal_body %}
			<div class="filters-modal-body">
				<div class="filters-modal-scroll">

					<h4 class="filters-to-apply-title d-none">Filtros a aplicar</h4>
					<div class="filters-to-apply accordion-container px-0 d-none"></div>

					{% include 'snipplets/grid/sort-by.tpl' %}

					{% if has_filters_available %}
						{% if filter_categories is not empty %}
							{% include "snipplets/grid/categories.tpl" with {modal: true} %}
						{% endif %}

						{% if product_filters is not empty %}
							{% include "snipplets/grid/filters.tpl" with {modal: true} %}
						{% endif %}

						<div class="js-sorting-overlay filters-overlay" style="display: none;">
							<div class="filters-updating-message">
								<span class="h5 mr-2">{{ 'Ordenando productos' | translate }}</span>
								<span>
									<svg class="icon-inline h5 icon-spin svg-icon-text"><use xlink:href="#spinner-third"/></svg>
								</span>
							</div>
						</div>
					{% endif %}
				</div>

				{% if has_filters_available %}
					<!-- Botones sticky -->
					<div class="filters-apply mt-3 d-flex">
						<a href="{{ request.path }}" class="btn btn-borrar-filtro mr-3 js-remove-all-filters">
							{{ 'QUITAR FILTROS' | translate }}
						</a>

						<a href="{{ request.path }}" id="boton-send" class="btn btn-agregar-filtro flex-grow-1">
							{{ 'VER RESULTADOS' | translate }}
						</a>
					</div>
				{% endif %}
			</div>
		{% endblock %}

	{% endembed %}
</div>
