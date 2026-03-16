{# /*============================================================================
  # Carousel with banner (wrapper genérico reutilizable)
============================================================================== #}

{% set section_list    = section_list    | default(null) %}
{% set section_name    = section_name    | default('primary') %}
{% set products_title  = products_title  | default(false) %}
{% set section_banner  = section_banner  | default(false) %}
{% set banner_enabled  = banner_enabled  | default(false) %}

{# Controla si el banner va al final (derecha) en desktop #}
{% set banner_end = banner_end | default(false) %}

{# Orden dinámico para desktop (la .row ya es flex) #}
{% set banner_order_md   = banner_end ? 'order-md-2' : 'order-md-1' %}
{% set products_order_md = banner_end ? 'order-md-1' : 'order-md-2' %}

{# Útil si querés inspeccionar en el DOM o estilizar por posición #}
{% set banner_position = banner_end ? 'end' : 'start' %}


{# Default: solo si NO vino show_title, lo ponemos en true #}
{% if show_title is not defined %}
	{% set show_title = true %}
{% endif %}

{% if show_title_mobile is not defined %}
	{% set show_title_mobile = true %}
{% endif %}

{# Si no hay productos, no mostramos nada #}
{% if section_list and section_list.products is defined and section_list.products|length %}

	{# ID seguro #}
	{% if section_list.id is defined and section_list.id %}
		{% set section_id = section_list.id %}
	{% else %}
		{% set section_id = section_name %}
	{% endif %}

	{% set banner_exists = section_banner ? true : false %}
	{% set has_banner = banner_enabled and banner_exists %}

	<section class="section-home mb-0 mt-4 section-{{ section_id }}-home {% if template == '404' %}w-100{% endif %}" data-store="home-products-{{ section_name }}">

		<div
			class="container-fluid px-0 mx-0">


			{# Fila de título siempre presente si hay texto (semántica) #}

			<div class="row mx-0">
				<div class="col-12">
					<h2 class="section-title h4-huge h3-huge-md mb-3 d-none {% if show_title %}d-md-block{% endif %}">
						{{ products_title }}
					</h2>
				</div>
			</div>

			{% if products_title_mobile %}
				<div class="row d-md-none mx-0 mb-2">
					<div class="col-12">
						<div class="d-flex justify-content-start align-items-center carrousel-title-mobile px-1 mb-3">
							<p class="section-title  h5 m-0">
								{{ products_title }}
							</p>

							{% if section_url %}
								<a href="{{ section_url }}" class="text-uppercase fw-bold d-inline-flex align-items-center ver-todo-text-banner">
									{% include "snipplets/svg/arrow-right.tpl" with {
              svg_custom_class: "icon-inline icon-2x svg-icon-text mx-2"
            } %}
									Ver todo

								</a>
							{% endif %}
						</div>
					</div>
				</div>
			{% endif %}

			<div class="row mx-0 align-items-stretch">

				{% if has_banner %}
					{# --- CON BANNER: 3 (banner) + 9 (productos) --- #}
					<div class="col-md-3 {{ banner_order_md }}" data-banner-position="{{ banner_position }}">
						<div class="d-none d-md-block mt-0 h-100">
							{% if section_url %}
								<a href="{{ section_url }}" class="d-block h-100">
									<img src="{{ 'images/empty-placeholder.png' | static_url }}" data-srcset="{{ section_banner | static_url | settings_image_url('large') }} 350w" data-sizes="auto" class="lazyload w-100 h-100" style="object-fit: cover;" alt="{{ products_title ?: 'Banner ' ~ section_name }}">
								</a>
							{% else %}
								<img src="{{ 'images/empty-placeholder.png' | static_url }}" data-srcset="{{ section_banner | static_url | settings_image_url('large') }} 350w" data-sizes="auto" class="lazyload w-100 h-100" style="object-fit: cover;" alt="{{ products_title ?: 'Banner ' ~ section_name }}">
							{% endif %}
						</div>
					</div>

					<div class="col-md-9 px-0 mx-0 d-flex flex-column my-0 {{ products_order_md }}">
						{% include 'snipplets/components/product/featured-products.tpl' with {
						section_list: section_list,
						section_name: section_name
						} %}
					</div>
				{% else %}
					{# --- SIN BANNER: productos full width --- #}
					<div class="col-12 px-0 px-md-4 d-flex flex-column">
						{% include 'snipplets/components/product/featured-products.tpl' with {
						section_list: section_list,
						section_name: section_name
						} %}
					</div>
				{% endif %}


			</div>
		</div>
	</section>

{% endif %}
