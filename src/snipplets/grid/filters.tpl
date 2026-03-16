{% if applied_filters %}

  {# Applied filters chips #}

  {% if has_applied_filters %}
    {% for product_filter in product_filters %}
      {% for value in product_filter.values %}
        {% if value.selected %}
          <button
            class="applied-filters js-remove-filter chip"
            data-filter-name="{{ product_filter.key }}"
            data-filter-value="{{ value.name }}"
          >
            {{ value.pill_label }}
            {% include "snipplets/svg/times.tpl" with {svg_custom_class: "icon-inline chip-remove-icon"} %}
          </button>
        {% endif %}
      {% endfor %}
    {% endfor %}
  {% endif %}

{% else %}

  {% if product_filters is not empty %}
    <div id="filters" data-store="filters-nav">

      {% for product_filter in product_filters %}

        {# 1) Seguís tratando el filtro de precio como antes #}
        {% if product_filter.type == 'price' %}

          {# Filtro de precio acá si lo usás #}

        {# 2) Acá salteamos MARCA por key (brand) #}
        {% elseif product_filter.key == 'brand' %}
          {# No renderizamos nada para "Marca" #}

        {# 3) El resto de filtros normales #}
        {% else %}
          {% if product_filter.has_products %}

            <div id="custom-filter-{{ product_filter.key }}" class="p-0">
              <div class="mt-1">
                <span class="h5 d-block mb-2 filter-name">{{ product_filter.name }}</span>

                <div class="checkbox-group">
                  {% set visible_count = 0 %}
                  {% set max_visible = 5 %}

                  {% for value in product_filter.values %}
                    {% if value.product_count > 0 %}
                      {% set visible_count = visible_count + 1 %}
                      {% set is_extra = visible_count > max_visible %}

                      <div
                        class="checkbox-item
                               {% if not value.selected %}js-filter-apply{% else %}selected js-filter-remove{% endif %}
                               checkbox-container
                               {% if mobile %}mb-3{% else %}mb-2{% endif %}
                               {% if is_extra %}extra-filter-value d-none{% endif %}"
                        data-filter-name="{{ product_filter.key }}"
                        data-filter-value="{{ value.name }}"
                      >
                        <input
                          id="{{ product_filter.key }}-{{ value.name }}"
                          class="checkbox-input d-none"
                          type="checkbox"
                          autocomplete="off"
                          {% if value.selected %}checked{% endif %}
                        >
                        <label for="{{ product_filter.key }}-{{ value.name }}">
                          {{ value.name }}
                        </label>
                      </div>
                    {% endif %}
                  {% endfor %}
                </div>

                {% if visible_count > max_visible %}
                  <button
                    type="button"
                    class="btn btn-ver-filtros mb-2 js-see-more-filter-values"
                  >
                    {{ "Ver más +" | translate }}
                  </button>
                {% endif %}
              </div>
            </div>

          {% endif %}
        {% endif %}
      {% endfor %}
    </div>
  {% endif %}
{% endif %}
