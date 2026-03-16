{# snipplets/grid/item/description.tpl
   Props esperados:
   - product
   - product_url
   - reduced_item
#}

{# ========================= DESCRIPCIÓN / META =========================
Colores (swatches), brand, nombre y precios (actual y tachado).
El enlace envuelve nombre y precios para llevar al PDP/variant seleccionado.
======================================================================= #}
{% set cuotas_sin_interes = settings.cuotas_sin_interes | default(false) %}
{% set cuotas_sin_interes_desde = settings.cuotas_sin_interes_desde| default(false) %}
{% set mostrar_precio = settings.mostrar_precio | default(false) %}

{% set cant_cuotas = settings.cuotas_sin_interes_values | default(3) %}
{% set precio_cuota = (product.price / cant_cuotas)  %}
{% set cuotas_personalizado = settings.cuotas_personalizado %}

<div class="item-description px-1 mt-auto" data-store="product-item-info-{{ product.id }}">

  <a href="{{ product_url }}" title="{{ product.name }}" class="item-link">
    <div
      class="js-item-name item-name mt-2"
      data-store="product-item-name-{{ product.id }}"
    >
      {{ product.name }}
    </div>

    {% if product.display_price and mostrar_precio %}
      <div
        class="item-price-container mt-1 mb-1"
        data-store="product-item-price-{{ product.id }}"
      >
        <span class="js-price-display item-price">
          {{ product.price | money | replace(',00','') }}
        </span>

        {% if not reduced_item %}
          <span
            class="js-compare-price-display price-compare"
            {% if not product.compare_at_price or not product.display_price %}
              style="display:none;"
            {% else %}
              style="display:inline-block;"
            {% endif %}
          >
            {{ product.compare_at_price | money | replace(',00','') }}
          </span>
        {% endif %}
      </div>

      {% if cuotas_sin_interes %}
        <div class="item-installments-info">
          
            <span class="installment-text">{{ cant_cuotas }} Cuotas sin interés de {{ precio_cuota | money | replace(',00','') }}</span>
          
        </div>
      {% endif %}

      {% if cuotas_sin_interes_desde %}
        <div class="item-installments-info">
          
            <span class="installment-text">{{ cuotas_personalizado }}</span>
          
        </div>
      {% endif %}
    {% endif %}
  </a>

 {# Botón solo para ver producto, sin agregar al carrito #}
    <div class="d-flex justify-content-center align-items-center mt-2">
      <a href="{{ product_url }}"
        class="btn btn-shop-2 ml-2 {{ item_state }} px-1 px-md-2 mb-1 mx-auto">
        Ver producto
      </a>
    </div>
</div>

