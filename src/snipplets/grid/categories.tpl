{% if filter_categories %}
  {% set max_visible = 5 %}

  <div id="custom-filter-categories" class="p-0">
    <div class="mt-3">
      <span class="h5 d-block mb-2 filter-name">{{ "Categorías" | translate }}</span>

      <div class="cats-group-filter">
        {% for category in filter_categories %}
          {% set is_extra = loop.index > max_visible %}

          <a href="{{ category.url }}"
             title="{{ category.name }}"
             class="cats-link-filter">
            <div
              class="cats-item-filter mb-1 {% if is_extra %}extra-category d-none{% endif %}"
              data-item="{{ loop.index }}"
            >
              {{ category.name }}
            </div>
          </a>
        {% endfor %}
      </div>

      {# Botón "Ver más" solo si hay más de max_visible #}
      {% if filter_categories|length > max_visible %}
        <button
          type="button"
          class="btn btn-ver-filtros p-0 mb-2 js-see-more-cats"
        >
          {{ "Ver más +" | translate }}
        </button>
      {% endif %}
    </div>
  </div>
{% endif %}
