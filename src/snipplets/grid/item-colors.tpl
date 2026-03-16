{% if product.variations %}
  {% for variation in product.variations %}
    {% if variation.name in ['Color', 'Cor'] %}

      {% set total_variations = variation.options | length %}

      <div class="js-color-variant-available-{{ loop.index }} js-color-variant-active d-flex"
           data-value="variation_{{ loop.index }}"
           data-option="{{ loop.index0 }}">

        {# === CASO 1: 1 o 2 colores → sin Swiper, simple === #}
        {% if total_variations <= 2 %}
          <div class="item-colors d-flex align-items-center">
            {% for option in variation.options %}
              <span
                class="item-colors-bullet js-color-variant{% if loop.first %} selected{% endif %}"
                {% if option.custom_data %}style="background: {{ option.custom_data }};"{% endif %}
                data-option="{{ option.id }}"
                title="{{ option.id }}"
                data-image="{{ option.image | product_image_url('medium') }}"
                data-variation-id="{{ variation.id }}">
              </span>
            {% endfor %}
          </div>

        {# === CASO 2: más de 2 colores → Swiper con chevrons === #}
        
{% else %}
  <div class="item-colors item-colors--swiper">
    <button type="button"
            class="item-colors-nav item-colors-nav-prev js-swiper-colors-prev">
      {% include "snipplets/svg/chevron-left.tpl" with {
        svg_custom_class: "icon-inline icon-w-8 svg-icon-text"
      } %}
    </button>

    <div class="swiper-container js-swiper-colors">
      <div class="swiper-wrapper">
        {% for option in variation.options %}
          <div class="swiper-slide">
            <span
              class="item-colors-bullet js-color-variant{% if loop.first %} selected{% endif %}"
              {% if option.custom_data %}style="background: {{ option.custom_data }};"{% endif %}
              data-option="{{ option.id }}"
              title="{{ option.id }}"
              data-image="{{ option.image | product_image_url('medium') }}"
              data-variation-id="{{ variation.id }}">
            </span>
          </div>
        {% endfor %}
      </div>
    </div>

    <button type="button"
            class="item-colors-nav item-colors-nav-next js-swiper-colors-next">
      {% include "snipplets/svg/chevron-right.tpl" with {
        svg_custom_class: "icon-inline icon-w-8 svg-icon-text"
      } %}
    </button>
  </div>
{% endif %}


      </div>

    {% endif %}
  {% endfor %}
{% endif %}
