{# posision de elementos del header mobile #}
{% set logo_mobile_position = "order-2" %}
{% set navigation_mobile_position = "order-1" %}
{% set utilities_mobile_position = "order-3" %}

{# posision de elementos del header desktop #}
{% set is_search_bar = settings.input_search_open %}
{% set logo_order_desktop = settings.header_position == 'left' ? 1 : 2 %}

{% if logo_order_desktop == 1 %}
  {% set logo_aling_desktop = "text-md-start" %}
  {% set navigation_desktop_order = 2 %}
{% else %}
  {% set logo_aling_desktop = "text-md-center" %}
  {% set navigation_desktop_order = 1 %}
{% endif %}

{% set logo_desktop_position = "order-md-" ~ logo_order_desktop %}
{% set navigation_desktop_position = "order-md-" ~ navigation_desktop_order %}
{% set utilities_desktop_position = "order-md-3" %}

{# Toggles reales (según tu settings) #}
{% set show_header_menu_superior = settings.show_nav_superior %}
{% set show_header_menu_inferior = settings.show_nav_inferior %}

{# CSS Vars desde settings (con fallback) #}
{% set header_bg    = settings.color_header ?: '#ffffff' %}
{% set header_text  = settings.color_text_header ?: '#111111' %}
{% set header_hover = settings.color_text_hover_header ?: header_text %}

{# Site Overlay #}
<div class="js-overlay site-overlay" style="display: none;"></div>

{# Header #}
{% set show_transparent_head = template == 'home' and settings.head_transparent and settings.slider and not settings.slider is empty %}

<header
  class="js-head-main head-main head-text-color
  {% if show_transparent_head %}head-transparent {% if settings.head_fix %}head-transparent-fixed{% else %}head-transparent-absolute{% endif %}{% endif %}
  {% if settings.head_fix %}head-fix{% endif %}
  {% if not settings.head_fix and show_transparent_head %}head-absolute{% endif %}"
  data-store="head"
  style="--header-background: {{ header_bg }}; --head-text-color: {{ header_text }}; --head-hover-color: {{ header_hover }};"
>

  {# Barra de mensaje superior #}
  {% if settings.ad_bar and (settings.ad_01_text or settings.ad_02_text or settings.ad_03_text) %}
    {% snipplet "header/header-advertising.tpl" %}
  {% endif %}

  {# Contenedor de la seccion principal del header #}
  <div class="container-fluid px-md-5 position-relative header-container">
    <div class="row no-gutters align-items-center">

      {# logo de la marca #}
      <div class="col {{ logo_mobile_position }} {{ logo_desktop_position }} flex-md-grow-1">
        {% include 'snipplets/header/header-logo.tpl' with { desktop_class: logo_aling_desktop } %}
      </div>

      {# menu de navegacion (hamburger) #}
      <div class="col header-navigation {{ navigation_mobile_position }} {{ navigation_desktop_position }} d-md-none head-text-color">
        {% snipplet "navigation/navigation-hamburger-only.tpl" %}
      </div>

      {# Navegacion en menu superior (desktop) #}
      <div class="col header-navigation d-none d-md-block {{ navigation_desktop_position }}">
        {% if show_header_menu_superior %}
          {% include "snipplets/navigation/navigation-nav-list-desktop.tpl"
            with { menu_items: menus[settings.header_menu_superior|lower] } %}
        {% endif %}

        {% if is_search_bar %}
          {% include "snipplets/header/header-search.tpl" with { search_modal: false } %}
        {% endif %}
      </div>

      {# utilidades del header #}
      <div class="col {{ utilities_mobile_position }} {{ utilities_desktop_position }} text-right head-text-color">
        {# IMPORTANTE: en header-utilities.tpl tenés que usar hide_search_icon para ocultar el icono #}
        {% include "snipplets/header/header-utilities.tpl" with { hide_search_icon: is_search_bar } %}
      </div>

      {# Notificaciones de compra #}
      {% if settings.head_fix and settings.ajax_cart %}
        {% include "snipplets/notification/notification.tpl" with { add_to_cart: true } %}
      {% endif %}
    </div>
  </div>

  {# Notificacion de seguimiento de orden #}
  {% include "snipplets/notification/notification.tpl" with { order_notification: true } %}

  {# Menu modal de Hamburguesa #}
  {% embed "snipplets/modal.tpl" with{
    modal_id: 'nav-hamburger',
    modal_class: 'nav-hamburger',
    modal_position: 'left',
    modal_transition: 'fade',
    modal_width: 'full',
    custom_close: true,
    modal_fixed_footer: false,
    modal_footer: false,
    modal_header_class: 'd-flex justify-content-between justify-content-md-end mt-1 mb-2 mt-md-0 pl-3',
    modal_footer_class: 'p-0'
  } %}
    {% block modal_close %}
      CERRAR
    {% endblock %}
    {% block modal_head %}
      {{ store.logo
        | img_tag(store.name, { class: 'logo-img order-first my-0' })
        | a_tag(store.url, store.name, 'd-inline-block order-first d-md-none') }}
    {% endblock %}
    {% block modal_body %}
      {% include "snipplets/navigation/navigation-panel.tpl" with { primary_links: true } %}
    {% endblock %}
    {% block modal_foot %}
      {% include "snipplets/navigation/navigation-panel.tpl" %}
    {% endblock %}
  {% endembed %}

  {# ====== WRAP DESKTOP (Menu inferior) ====== #}
  {% if show_header_menu_inferior %}
    <div class="cats-desktop-wrap d-none d-md-block js-accordion-container">

      {# Barra de categorías #}
      <nav class="head-cats-bar" aria-label="Categorías" style="--cats: {{ menus[settings.header_menu_inferior|lower]|length }}">
        <div class="container-fluid px-md-5">
          {% include "snipplets/navigation/navigation-nav-list-desktop.tpl"
            with { menu_items: menus[settings.header_menu_inferior|lower] } %}
        </div>
      </nav>

      {# Chevron (comentado como lo tenías)
      <div class="menu-desktop-chevron text-center pb-1">
        <a href="#" class="js-accordion-toggle d-inline-flex align-items-center justify-content-center" aria-expanded="false" aria-controls="desktop-cats-panel">
          <span class="js-accordion-toggle-inactive">{% include "snipplets/svg/double-chevron.tpl" with {svg_custom_class: "icon-inline icon-lg-2 svg-icon-invert"} %}</span>
          <span class="js-accordion-toggle-active" style="display:none;"><span class="icon-rotate-180 d-inline-block">{% include "snipplets/svg/double-chevron.tpl" with {svg_custom_class: "icon-inline icon-w-14 svg-icon-invert"} %}</span></span>
        </a>
      </div> #}

    </div>
  {% endif %}

</header>

{# Notificaciones de compra con el header no siempre visible #}
{% if not settings.head_fix %}
  {% include "snipplets/notification/notification.tpl" with { add_to_cart: true, add_to_cart_fixed: true } %}
{% endif %}

{# Show cookie validation message #}
{% include "snipplets/notification/notification.tpl" with { show_cookie_banner: true } %}

{# Modal de busqueda #}
{% embed "snipplets/modal.tpl" with{ modal_id: 'nav-search', modal_position: 'right', modal_transition: 'slide', modal_width: 'docked-md' } %}
  {% block modal_body %}
    {% snipplet "header/header-search.tpl" %}
  {% endblock %}
{% endembed %}

{# Si la tienda no es del tipo catalogo, esta habilitado el quickshop y no el usuario no esta en la pagina de carrito #}
{% if not store.is_catalog and settings.ajax_cart and template != 'cart' %}

  {# Cart Ajax #}
  {% embed "snipplets/modal.tpl" with{
    modal_id: 'modal-cart',
    modal_position: 'right',
    modal_transition: 'slide',
    modal_width: 'docked-md',
    modal_form_action: store.cart_url,
    modal_form_class: 'js-ajax-cart-panel',
    modal_mobile_full_screen: true,
    modal_form_hook: 'cart-form'
  } %}
    {% block modal_head %}
      {% block page_header_text %}
        {{ "Carrito de Compras" | translate }}
      {% endblock page_header_text %}
    {% endblock %}
    {% block modal_body %}
      {% snipplet "cart-panel.tpl" %}
    {% endblock %}
  {% endembed %}

  {# Si estan habilitadas las recomendaciones en el carrito #}
  {% if settings.add_to_cart_recommendations %}

    {# Modal de productos recomendados #}
    {% embed "snipplets/modal.tpl" with{
      modal_id: 'related-products-notification',
      modal_class: 'bottom modal-overflow-none modal-bottom-sheet h-auto',
      modal_header_class: 'px-0 pt-0 mb-2 m-0 w-100',
      modal_position: 'bottom',
      modal_transition: 'slide',
      modal_width: 'centered modal-centered-md-600px p-3'
    } %}
      {% block modal_head %}
        {% block page_header_text %}
          {{ '¡Agregado al carrito!' | translate }}
        {% endblock page_header_text %}
      {% endblock %}
      {% block modal_body %}
        {% include "snipplets/notification/notification-cart.tpl" with { related_products: true } %}
        <div class="js-related-products-notification-container" style="display: none"></div>
      {% endblock %}
    {% endembed %}
  {% endif %}
{% endif %}

{# Modal de Cross-Selling #}
{% embed "snipplets/modal.tpl" with {
  modal_id: 'js-cross-selling-modal',
  modal_class: 'bottom modal-bottom-sheet h-auto overflow-none modal-body-scrollable-auto',
  modal_header: true,
  modal_header_class: 'm-0 w-100',
  modal_position: 'bottom',
  modal_transition: 'slide',
  modal_footer: true,
  modal_width: 'centered-md m-0 p-0 modal-full-width modal-md-width-400px'
} %}
  {% block modal_head %}
    {{ '¡Descuento exclusivo!' | translate }}
  {% endblock %}

  {% block modal_body %}
    <div class="js-cross-selling-modal-body" style="display: none"></div>
  {% endblock %}
{% endembed %}
