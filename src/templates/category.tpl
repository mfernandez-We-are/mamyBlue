{% set has_filters_available = products and has_filters_enabled and (filter_categories is not empty or product_filters is not empty) %}


{% set show_help = not has_products %}
{% paginate by 12 %}

{% if not show_help %}

  <section class="category-header section-margin">
    <div class="container-fluid px-0">
      <div class="row no-gutters">
        <div class="col text-center">
          {% include 'snipplets/components/banners/category-banner-with-mobile.tpl' %}
        </div>
      </div>
    </div>
  </section>

  <section class="category-body">
    <div class="container-fluid">

      <div class="js-category-controls-prev category-controls-sticky-detector"></div>

      <div class="js-category-controls row align-items-center my-0 mb-md-3 pt-0 pb-1 category-controls">

        <div class="col">
          {% include 'snipplets/components/assets/breadcrumbs.tpl' with { breadcrumbs_custom_class: 'text-left my-1 my-md-3' } %}

          {% if products %}
		  
            {% include "snipplets/grid/filters.tpl" with { applied_filters: true } %}
          {% endif %}
        </div>

        {% if products %}
        
          {# <div class="d-none d-md-flex ml-auto">
            {% include "snipplets/grid/plp-layout-controls.tpl" %}
          </div> #}

          <div class="col-12 d-md-none row mx-0">
            {% include 'snipplets/grid/filters-modals.tpl' with { mobile: true } %}
          </div>
        {% endif %}
      </div>

{% if products %}

{% set search_page_filters = template == 'search' and search_filter %}
{% set category_page = template == 'category' %}
{% set show_filters_sidebar = has_filters_available and (category_page or search_page_filters) %}

<div class="row no-gutters">

  {% if show_filters_sidebar %}
    <aside class="filters-sidebar col-12 col-md-2 d-none d-md-block visible-when-content-ready">
	<div class="filtrar-head">
		<h2>{{category.name}}</h2>
	</div>

	<div class="ml-4">
			{% include 'snipplets/grid/sort-by.tpl' %}
			
			{% if filter_categories is not empty %}
				{% include "snipplets/grid/categories.tpl" with { modal: false } %}
			{% endif %}

			{% if product_filters is not empty %}
				{% include "snipplets/grid/filters.tpl" %}
			{% endif %}
      <div class="filters-apply mt-3 d-flex">
      
      <a
        href="{{ request.path }}"
        class="btn-borrar-filtro mr-3 js-remove-all-filters text-center"
      >
        {{ 'Borrar filtros' | translate }}
      </a>

   
      <a
        href="{{ request.path }}"
        id="boton-send"
        class="btn-agregar-filtro flex-grow-1 text-center"
      >
        {{ 'Aplicar filtros' | translate }}
      </a>
    </div>
	</div>


    </aside>
  {% endif %}

  <div class="col-12 {% if show_filters_sidebar %}col-md-10{% endif %}">
    <div
      class="product-table js-product-table d-flex justify-content-center row no-gutters"
      data-store="category-grid-{{ category.id }}"
    >
      {% include 'snipplets/product_grid.tpl' %}
    </div>
  </div>
</div>

        {% include 'snipplets/grid/pagination.tpl' with { infinite_scroll: true } %}

      {% else %}
        <p class="text-center">
          {{ (has_filters_enabled
            ? "No tenemos resultados para tu búsqueda. Por favor, intentá con otros filtros."
            : "Próximamente"
          ) | translate }}
        </p>
      {% endif %}
    </div>
  </section>

{% elseif show_help %}
  {% include 'snipplets/defaults/show_help_category.tpl' %}
{% endif %}