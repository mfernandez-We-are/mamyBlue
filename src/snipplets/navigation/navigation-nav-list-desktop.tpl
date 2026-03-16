{# ============= MENU DESKTOP (LIMPIO) ============= #}
{# Cantidad de items (una sola vez) #}
{% set cats_count = menu_items ? (menu_items|length) : 0 %}
{# ---------- Fila 1: Tabs del menú ---------- #}
<ul class="cats-list list-unstyled m-0" style="--cats: {{ cats_count }};">
  {% for item in menu_items %}

    {# Si el item es una categoría, la encontramos #}
    {% set cat = categories | filter(c => c.id == item.id) | first %}
    {% set has_subcategories = cat and cat.subcategories and cat.subcategories|length > 0 %}

    {# URL: si el item trae url (link custom), usamos esa; si no, la de la categoría #}
    {% set item_url = item.url ? (item.url | setting_url) : (cat ? cat.url : '#') %}

    {# Activo: category actual o su parent coincide con cat #}
    {% set is_active = false %}
    {% if template == 'category' and cat %}
      {% if category.id == cat.id or (category.parent and category.parent.id == cat.id) %}
        {% set is_active = true %}
      {% endif %}
    {% endif %}

    <li
      class="cats-item {% if has_subcategories %}js-accordion-toggle{% endif %}"
      {% if has_subcategories %}
        aria-expanded="false"
        aria-controls="desktop-cats-panel"
        data-component="header.categories"
        data-cat-id="{{ cat.id }}"
      {% endif %}
    >
      <a class="cats-link head-text-color head-text-hover {% if is_active %}is-active{% endif %}"
         href="{{ item_url }}">
        {{ item.name }}
      </a>
    </li>

  {% endfor %}
</ul>

{# ---------- Fila 2: Panel de subcategorías ---------- #}
<div id="desktop-cats-panel"
     class="js-accordion-content cats-subpanel"
     aria-hidden="true"
     style="display:none;">
  <div class="container-fluid m-0 p-0 position-relative">

    <button
      type="button"
      class="cats-subpanel-close js-cats-panel-close"
      aria-label="Cerrar menú de categorías">
      Cerrar ✕
    </button>

    <div class="cats-subgrid">
      {% for item in menu_items %}
        {% set cat = categories | filter(c => c.id == item.id) | first %}

        {% if cat and cat.subcategories and cat.subcategories|length > 0 %}
          <div class="cats-subcol" data-cat-id="{{ cat.id }}">
            <ul class="list-unstyled m-0">
              {% for sub in cat.subcategories %}
                <li>
                  <a class="sub-link head-text-color head-text-hover" href="{{ sub.url }}">
                    {{ sub.name }}
                  </a>
                </li>
              {% endfor %}

              <li class="see-all">
                <a class="sub-link-all head-text-color head-text-hover" href="{{ cat.url }}">
                  Ver todo
                </a>
              </li>
            </ul>
          </div>
        {% endif %}
      {% endfor %}
    </div>

  </div>
</div>
