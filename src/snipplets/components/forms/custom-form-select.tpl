{# /*============================================================================
  # Form Select (sin <select> nativo) — estilable + JS dinámico
  #=============================================================================
  # Props (opcionales)
  #  - select_group_custom_class: clases extra para wrapper
  #  - select_modifiers: clases BEM para variantes (ej: "c-select--sm c-select--ghost")
  #  - select_label: bool para renderizar label
  #  - select_label_name, select_label_id, select_for, select_label_custom_class
  #  - select_id: id lógico del control (usado para input hidden y aria)
  #  - select_name: name del hidden input (para enviar en forms)
  #  - select_value: valor inicial
  #  - select_placeholder: texto cuando no hay selección
  #  - select_custom_class: clases extra para el “botón” visual
  #  - select_disabled: bool -> deshabilita interacción
  #  - select_autosubmit: bool -> hace submit del form al cambiar
  #  - select_empty_text: texto a mostrar si no hay opciones
  #  - select_options_json: JSON con opciones (el JS poblará la lista)
  #
  # Slots:
  #  - block select_options: opcional, renderizá <li> como opciones (fallback estático)
  #
  # Marcado de opciones (si usás el block):
  #  <li class="custom-select-option {% if is_selected %}is-selected{% endif %} {% if is_disabled %}is-disabled{% endif %}"
  #      data-value="VALOR" role="option" aria-selected="{{ is_selected ? 'true' : 'false' }}">
  #    TEXTO DE OPCIÓN
  #  </li>
  #============================================================================#}

{% set _id = select_id | default('custom-select--' ~ random()) %}
{% set _value = select_value | default('') %}
{% set _placeholder = select_placeholder | default('Seleccioná una opción') %}
{% set _disabled = select_disabled | default(false) %}
{% set _empty_text = select_empty_text | default('Sin opciones') %}
{% set native_id = native_id | default('') %}
{% set chevron_custom_class = chevron_custom_class | default('icon-inline icon-w-14 icon-lg svg-icon-text') %}
{% set text_custom_class = text_custom_class | default('') %}
{% set select_searchable = select_searchable | default(false) %}
{% set select_search_placeholder = select_search_placeholder | default('Buscar...') %}
{% set select_no_results = select_no_results | default('Sin coincidencias') %}

<div class="custom-select form-group {{ select_group_custom_class }} {% if _disabled %}is-disabled{% endif %} {{ select_modifiers }}" data-select data-id="{{ _id }}" data-name="{{ select_name | default('') }}" data-disabled="{{ _disabled ? 'true' : 'false' }}" data-autosubmit="{{ select_autosubmit ? 'true' : 'false' }}" {% if select_options_json %} data-options='{{ select_options_json | raw }}' {% endif %} data-empty-text="{{ _empty_text | e('html_attr') }}" data-placeholder="{{ _placeholder | e('html_attr') }}" data-searchable="{{ select_searchable ? 'true' : 'false' }}" data-no-results="{{ select_no_results | e('html_attr') }}">
	{# label opcional y hidden input… (sin cambios) #}
	<button type="button" class="custom-select-button {{ select_custom_class }}" aria-haspopup="listbox" aria-expanded="false" aria-controls="{{ _id }}-listbox" aria-labelledby="{{ _id }}-label {{ _id }}-button" id="{{ _id }}-button" {% if _disabled %} disabled {% endif %}>
		<span class="custom-select-text {{ text_custom_class }}" id="{{ _id }}-label">
			{{ _value ? '' : _placeholder }}
		</span>
		<span class="custom-select-icon">
			{% include "snipplets/svg/chevron-down.tpl" with { svg_custom_class: chevron_custom_class } %}
		</span>
	</button>

	<div class="custom-select-list" id="{{ _id }}-listbox" role="listbox" tabindex="-1" hidden>
		{# --- buscador opcional --- #}
		{% if select_searchable %}
			<div class="custom-select-search px-2 py-2">
				<input type="text" class="custom-select-search-input form-control" data-role="search" placeholder="{{ select_search_placeholder }}" aria-label="Buscar en opciones"/>
			</div>
		{% endif %}

		{# opciones (tu block) #}
		<div class="custom-select-options" data-role="options"> {% block select_options %}{% endblock select_options %}
			</div>

			{# estado "sin resultados" #}
			<div class="custom-select-no-results text-muted small px-3 py-2 d-none" data-role="noresults">
				{{ select_no_results }}
			</div>
		</div>

		<div class="custom-select-status d-none" aria-hidden="true">
			<span class="custom-select-empty" data-role="empty">{{ _empty_text }}</span>
		</div>
	</div>
