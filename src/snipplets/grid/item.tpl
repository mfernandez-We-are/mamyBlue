
{# /*============================================================================
  # Item grid
  # Descripción: Card de producto para grilla/listado.
  # Rol: Orquestador. Contiene flags, lógica global, wrapper, quickshop wrapper,
  #      cálculo de URL, cuotas/contado y data estructurada.
  #      El markup pesado se delega a parciales en snipplets/grid/item/*.
=============================================================================*/ #}

{# ========================== PROPS / FLAGS ==========================
Normaliza flags iniciales y columnas.
==================================================================== #}
{# Variante por defecto del producto (la primera disponible) #}
{% set default_selected_product = product.selected_or_first_available_variant.options %}
{% set slide_item    = slide_item    | default(false) %}
{% set columns       = settings.grid_columns %}
{% set reduced_item  = reduced_item  | default(false) %}
{% set has_filters   = has_filters   | default(false) %}

{# Estado global del item (reutilizable en quickshop + acciones) #}
{% set item_state = store.is_catalog
  ? 'catalog'
  : (product.available
      ? (product.display_price ? 'cart' : 'contact')
      : 'nostock'
    )
%}

{% set item_state_texts = {
  'cart':    "Agregar al carrito",
  'contact': "Consultar precio",
  'nostock': "Sin stock",
  'catalog': "Consultar",
  'agregando': "Agregando...",
} %}



{# ================== DETECCIÓN DE VARIANTE DE COLOR ==================
Verifica si hay variación "Color/Cor" con +1 opción para activar UI de colores.
======================================================================= #}

{% set has_color_variant = false %}
{% if settings.product_color_variants and product.variations %}
  {% for variation in product.variations if variation.name in ['Color', 'Cor'] and variation.options | length > 1 %}
    {% set has_color_variant = true %}
  {% endfor %}
{% endif %}



{# ========================== WRAPPER DEL ITEM ==========================
Contenedor principal de la card.
Agrega clases según template, precio visible, modo reducido y data-* para tracking.
======================================================================= #}

<div class="js-item-product
  {% if slide_item %}js-item-slide swiper-slide{% endif %}
  item item-product
  {% if template == 'category' or template == 'search' %} col-6 col-md-3 {% endif %}
  {% if not product.display_price %} no-price{% endif %}
  {% if reduced_item %} item-product-reduced{% endif %}"
  data-product-type="list"
  data-product-id="{{ product.id }}"
  data-store="product-item-{{ product.id }}"
  data-component="product-list-item"
  data-component-value="{{ product.id }}">



    {# ================== CONTENEDOR QUICKSHOP / VARIANTS ==================
      Envueltas para quickshop/variantes. Cargan variants_object en data-attr
      y generan un id único para el modal si es slide.
    ====================================================================== #}
  {% if (settings.quick_shop or settings.product_color_variants) and not reduced_item %}
    <div class="js-product-container js-quickshop-container {% if product.variations %}js-quickshop-has-variants{% endif %}"
      data-variants="{{ product.variants_object | json_encode }}"
      data-quickshop-id="quick{{ product.id }}{% if slide_item and section_name %}-{{ section_name }}{% endif %}">
  {% endif %}



  {# =============== URL CON VARIANTE SELECCIONADA (SI HAY FILTROS) ===============
    Si hay filtros, agrega ?variant=<id> a la URL para mantener selección.
  ================================================================================ #}
  {% set product_url_with_selected_variant = has_filters
    ? (product.url | add_param('variant', product.selected_or_first_available_variant.id))
    : product.url
  %}



  {# ============================ BLOQUE DE IMAGEN ============================
Se delega a un parcial. Ahí se calcula imagen inicial (variant o product),
spacing (LQIP), lazyload, placeholder y labels.
============================================================================== #}

{% include 'snipplets/grid/item/item-image.tpl' with {
  product_url: product_url_with_selected_variant
} %}




  {# ===================== FORMULARIO OCULTO DE VARIANTES =====================
Form hidden para actualizar imagen/variantes y usar en quickshop.
Renderiza selects, cantidad y CTA Add-to-cart según estado.
=========================================================================== #}
{# 
  {% if (settings.quick_shop or settings.product_color_variants)
        and product.available
        and product.display_price
        and product.variations
        and not reduced_item
  %}
    {% include 'snipplets/grid/item/item-quickshop-form.tpl' %}
  {% endif %} #}
  {# =========================== ACCIONES / CTA ===========================
Lógica de “Agregar al carrito”.
- Con variantes: abre Quickshop modal.
- Sin variantes: post directo al cart.
Solo si quick_shop está habilitado, producto disponible y con precio.
======================================================================= #}

  {% if settings.quick_shop and product.available and product.display_price and not reduced_item %}
    {% include 'snipplets/grid/item/item-actions.tpl' %}
  {% endif %}



  {# ========================= DESCRIPCIÓN / META =========================
Colores (swatches), brand, nombre y precios (actual + tachado).
El enlace envuelve nombre y precios para llevar al PDP/variant seleccionado.
=========================================================================== #}

{% include 'snipplets/grid/item/item-description.tpl' with {
  product: product,
  product_url: product_url_with_selected_variant,
  reduced_item: reduced_item
} %}


  {# ==================== PRECIO CON DESCUENTO POR PAGO ====================
Componente opcional para mostrar precio con descuento por medio de pago.
Se delega a parcial para poder reutilizarlo en otras vistas si hace falta.
========================================================================== #}
{{ component('payment-discount-price', {
      visibility_condition: settings.payment_discount_price and not reduced_item,
      location: 'product',
      container_classes: "text-accent mb-2",
    })
  }}


  {# ========================= CUOTAS / CONTADO =========================
Cuotas y precio contado. Se mantienen inline porque ya son componentes
reutilizables y bastante acotados.
===================================================================== #}
{# 
    {{ component('installments', {
      location: 'product_item',
      container_classes: { installment: "px-2 item-installments" }
    }) }}

    {% include 'snipplets/product/product-price-cash.tpl' with {
      container_class: 'item-installments installment-cash pb-2 px-2'
    } %}
 

 #}




  {# ====================== DATA ESTRUCTURADA (SEO) ======================
Schema para que Google entienda el contenido del producto.
======================================================================= #}

  {{ component('structured-data', {'item': true}) }}



  {# ====================== CIERRE QUICKSHOP WRAPPERS ======================
Si se abrió el contenedor de quickshop al inicio, cerrarlo acá.
========================================================================= #}

  {% if (settings.quick_shop or settings.product_color_variants) and not reduced_item %}
    </div>
  {% endif %}

</div>
