{% set sort_text = {
  'user': 'Destacado',
  'price-ascending': 'Precio: Menor a Mayor',
  'price-descending': 'Precio: Mayor a Menor',
  'created-ascending': 'Más Viejo al más Nuevo',
  'created-descending': 'Más Nuevo al más Viejo',
  'best-selling': 'Más Vendidos',
} %}

<div id="custom-filter-order-by" class="p-0">
  <div class="mt-1">
    <span class="h5 d-block mb-2 filter-name">Ordenar</span>

    <div class="order-by-group">
      {% for sort_method in sort_methods %}
        {% if sort_method in sort_text|keys %}
          {% if sort_method != 'user' or category.sort_method == 'user' %}
            <label class="order-by-option">
              <input
                type="radio"
                name="sort_by"
                class="js-sort-by"
                value="{{ sort_method }}"
                {% if sort_by == sort_method %}checked{% endif %}
              >
              <span class="order-by-label">
                {{ sort_text[sort_method] | t }}
              </span>
            </label>
          {% endif %}
        {% endif %}
      {% endfor %}
    </div>
  </div>
</div>
