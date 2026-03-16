{% set has_social_network = store.facebook or store.twitter or store.pinterest or store.instagram or store.tiktok or store.youtube or settings.twitch_url %}

{% set has_footer_contact_info = (store.whatsapp or store.phone or store.email or store.address or store.blog) and settings.footer_contact_show %}
{% set has_footer_info = settings.footer_info_show and (settings.footer_info_title or settings.footer_info_text) %}
{% set has_footer_menu_primary = settings.footer_menu_primary and settings.footer_menu_primary_show %}
{% set has_footer_menu_secondary = settings.footer_menu_secondary and settings.footer_menu_secondary_show %}
{% set has_payment_logos = settings.payments %}
{% set has_shipping_logos = settings.shipping %}
{% set has_shipping_payment_logos = has_payment_logos or has_shipping_logos %}
{% set has_languages = languages | length > 1 and settings.languages_footer %}
{% set show_footer_logo = "footer_logo.jpg" | has_custom_image %}
{% set has_seal_logos = store.afip or ebit or settings.custom_seal_code or ("seal_img.jpg" | has_custom_image) %}
{% set show_right_md_col_logo = show_footer_logo and not settings.news_show %}
{% set has_right_md_col_content = (settings.news_show or has_footer_contact_info or has_shipping_payment_logos or has_languages or has_social_network) or show_right_md_col_logo %}
{% set vertical_spacing_classes = 'mb-4 pb-2 mb-md-5 pb-md-0' %}
{% set password_page = template == 'password' %}

{% set footer_aditional_info_title_1 = settings.footer_aditional_info_title_1 %}
{% set footer_aditional_info_content_1 = settings.footer_aditional_info_content_1 %}
{% set footer_aditional_info_title_2 = settings.footer_aditional_info_title_2 %}
{% set footer_aditional_info_content_2 = settings.footer_aditional_info_content_2 %}
{% set footer_aditional_info_title_3 = settings.footer_aditional_info_title_3 %}
{% set footer_aditional_info_content_3 = settings.footer_aditional_info_content_3 %}

<footer class="js-footer js-hide-footer-while-scrolling display-when-content-ready pt-3 pt-md-5" data-store="footer">
	<div class="container-fluid">
		<div class="footer-layout row col-12 col-md-11 mx-auto px-0 {% if template == 'password' %}justify-content-md-center{% endif %}">

			{% if has_footer_info %}
				<div class="col-12 col-md-12 d-none d-md-flex justify-content-center mb-1 text-center text-md-left ">
					<div class="d-flex flex-column justify-content-center align-items-center contenedor-footer-info">
						{% if settings.footer_info_title %}
							<div class="footer-store-info-title mb-3 text-center">{{ settings.footer_info_title }}</div>
						{% endif %}
						<p class="footer-info-text text-center">{{settings.footer_info_text}}</p>
					</div>
				</div>

			{% endif %}

			{% if template != 'password' %}

				{# Foot Nav #}
				{% if has_footer_menu_primary %}
					<div class="{% if settings.footer_menus_toggle %}js-accordion-container{% endif %} col-12 col-md mb-1">
						{% if settings.footer_menus_toggle %}
							<a href="#" class="js-accordion-toggle-mobile row no-gutters">
							{% endif %}
							{% if settings.footer_menu_primary_title %}
								<div class="footer-column-title mb-3 {% if settings.footer_menus_toggle %}col{% endif %}">{{ settings.footer_menu_primary_title }}</div>
							{% endif %}
							{% if settings.footer_menus_toggle %}
								<span class="d-md-none">
									<span class="js-accordion-toggle-inactive">
										{% include "snipplets/svg/plus.tpl" with {svg_custom_class: "icon-inline "} %}
									</span>
									<span class="js-accordion-toggle-inactive" style="display: none;">
										{% include "snipplets/svg/minus.tpl" with {svg_custom_class: "icon-inline "} %}
									</span>
								</span>
							</a>
							<div class="js-accordion-content js-accordion-content-mobile">
							{% endif %}
							{% include "snipplets/footer/navigation/navigation-foot.tpl" with { 'footer_menu': settings.footer_menu_primary } %}
							{% if settings.footer_menus_toggle %}
							</div>
						{% endif %}
					</div>
				{% endif %}

				{# Foot Nav Secondary #}
				{% if has_footer_menu_secondary %}
					<div class="{% if settings.footer_menus_toggle %}js-accordion-container{% endif %} col-12 col-md pr-md-6 mb-1">
						{% if settings.footer_menus_toggle %}
							<a href="#" class="js-accordion-toggle-mobile row no-gutters">
							{% endif %}
							{% if settings.footer_menu_secondary_title %}
								<div class="footer-column-title mb-3 {% if settings.footer_menus_toggle %}col{% endif %}">{{ settings.footer_menu_secondary_title }}</div>
							{% endif %}
							{% if settings.footer_menus_toggle %}
								<span class="d-md-none">
									<span class="js-accordion-toggle-inactive">
										{% include "snipplets/svg/plus.tpl" with {svg_custom_class: "icon-inline "} %}
									</span>
									<span class="js-accordion-toggle-inactive" style="display: none;">
										{% include "snipplets/svg/minus.tpl" with {svg_custom_class: "icon-inline "} %}
									</span>
								</span>
							</a>
							<div class="js-accordion-content js-accordion-content-mobile">
							{% endif %}
							{% include "snipplets/footer/navigation/navigation-foot.tpl" with { 'footer_menu': settings.footer_menu_secondary } %}
							{% if settings.footer_menus_toggle  %}
							</div>
						{% endif %}
					</div>
				{% endif %}
			{% endif %}

			{# Contact info #}
			{% if has_footer_contact_info %}

				<div class="{% if settings.footer_menus_toggle %}js-accordion-container{% endif %} col-12 col-md mb-1">
					{% if settings.footer_menus_toggle %}
						<a href="#" class="js-accordion-toggle-mobile row no-gutters">
						{% endif %}
						{% if settings.footer_contact_title %}
							<div class="footer-column-title mb-3 {% if settings.footer_menus_toggle %}col{% endif %}">{{ settings.footer_contact_title }}</div>
						{% endif %}
						{% if settings.footer_menus_toggle %}
							<span class="d-md-none">
								<span class="js-accordion-toggle-inactive">
									{% include "snipplets/svg/plus.tpl" with {svg_custom_class: "icon-inline "} %}
								</span>
								<span class="js-accordion-toggle-inactive" style="display: none;">
									{% include "snipplets/svg/minus.tpl" with {svg_custom_class: "icon-inline "} %}
								</span>
							</span>
						</a>
						<div class="js-accordion-content js-accordion-content-mobile">
						{% endif %}
						{% include "snipplets/footer/navigation/contact-links.tpl" with {'footer': true} %}

						{% if settings.footer_menus_toggle %}
						</div>
					{% endif %}
				</div>
				<div class="col-12 d-block d-md-none mb-3">
					{% include "snipplets/components/social/social-links.tpl" %}
				</div>
			{% endif %}

		</div>

		<div class="col-12 d-flex d-md-none justify-content-center mb-1 text-center mx-0 px-0">
			{% include 'snipplets/newsletter.tpl' %}
		</div>

		{% if footer_aditional_info_title_1  %}
			<div class="footer-additional-info mt-3 d-md-none text-left">

				<div class="mb-2">
					<span class="footer-additional-label">{{ footer_aditional_info_title_1 }}</span>
					<span class="footer-additional-separator">|</span>
					<span class="footer-additional-text">{{ footer_aditional_info_content_1 }}</span>
				</div>
				<div class="mb-2">

					<span class="footer-additional-label">{{ footer_aditional_info_title_2 }}</span>
					<span class="footer-additional-separator">|</span>

					<a href="mailto:{{ footer_aditional_info_content_2 }}" class="footer-additional-text">
						{{ footer_aditional_info_content_2 }}
					</a>
				</div>
				<div class="mb-2">

					<span class="footer-additional-label">{{ footer_aditional_info_title_3 }}</span>
					<span class="footer-additional-separator">|</span>

					<a href="tel:{{ footer_aditional_info_content_3}}" class="footer-additional-text">
						{{ footer_aditional_info_content_3 }}
					</a>
				</div>

			</div>
		{% endif %}

		{% if has_social_network %}
			<div class="footer-social-bar w-100 py-3">
				<div class="row">
					<div class="col-12 col-md-11 mx-auto text-start text-md-center">
						{% include "snipplets/components/social/social-links.tpl" %}
					</div>
				</div>
			</div>
		{% endif %}
		<div class="mt-5 col-12 d-none d-md-flex justify-content-center mb-1 text-center">
			{% include 'snipplets/newsletter.tpl' %}
		</div>

		{# AFIP - EBIT - Custom Seal #}
		{% if has_seal_logos and template != 'password' %}
			{% if store.afip or ebit %}
				<div class="row justify-content-start my-4">
					<div class="col text-center">
						{% if store.afip %}
							<div class="footer-logo afip seal-afip">
								{{ store.afip | raw }}
							</div>
						{% endif %}
						{% if ebit %}
							<div class="footer-logo ebit seal-ebit">
								{{ ebit }}
							</div>
						{% endif %}
					</div>
				</div>
			{% endif %}
			{% if "seal_img.jpg" | has_custom_image or settings.custom_seal_code %}
				<div class="row justify-content-center mb-4">
					<div class="col text-center">
						{% if "seal_img.jpg" | has_custom_image %}
							<div class="footer-logo custom-seal">
								{% if settings.seal_url != '' %}
									<a href="{{ settings.seal_url | setting_url }}" target="_blank">
									{% endif %}
									<img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ "seal_img.jpg" | static_url }}" class="custom-seal-img lazyload" alt="{{ 'Sello de' | translate }} {{ store.name }}"/>
									{% if settings.seal_url != '' %}
									</a>
								{% endif %}
							</div>
						{% endif %}
						{% if settings.custom_seal_code %}
							<div class="custom-seal custom-seal-code">
								{{ settings.custom_seal_code | raw }}
							</div>
						{% endif %}
					</div>
				</div>
			{% endif %}
		{% endif %}

		{# Logos Payments and Shipping #}
		{% if has_shipping_payment_logos and template != 'password' %}
			<div class="footer-payments-shipping-logos text-center {% if languages | length > 1 %}mb-4{% else %}mb-5{% endif %}">
				{% if has_payment_logos %}
					<span class="mr-2-md">{% include "snipplets/footer/logos-icons.tpl" with {'payments': true} %}</span>
				{% endif %}
				{% if has_shipping_logos %}
					<span>{% include "snipplets/footer/logos-icons.tpl" with {'shipping': true} %}</span>
				{% endif %}
			</div>
		{% endif %}

		<div class="col-12 text-start text-md-center footer-bottom">

			<div class="footer-main-links">
				<span class="mr-2-md">Bender ©</span>
				<span class="mr-2-md">
					|
				</span>
				<a href="/politicas" class="mr-2-md footer-link">Políticas de privacidad</a>
				<span class="mr-2-md">
					|
				</span>
				<a href="/terminos-y-condiciones" class="mr-2-md footer-link">Términos y condiciones</a>
				<span class="mr-2-md">
					|
				</span>
				<a href="/contacto" class="mr-2-md footer-link">Contacto</a>
				<span class="mr-2-md">
					|
				</span>
				<a href="/preguntas-frecuentes" class="mr-2-md footer-link">Preguntas frecuentes</a>
			</div>


			{% if footer_aditional_info_title_1  %}
				<div class="d-none d-md-block footer-additional-info mt-2">


					<span class="footer-additional-label">{{ footer_aditional_info_title_1 }}</span>
					<span class="footer-additional-separator">
						|
					</span>
					<span class="footer-additional-text">{{ footer_aditional_info_content_1 }}</span>


					<span class="footer-additional-separator">&nbsp;&nbsp;</span>
					<span class="footer-additional-label">{{ footer_aditional_info_title_2 }}</span>
					<span class="footer-additional-separator">
						|
					</span>

					<a href="mailto:{{ footer_aditional_info_content_2 }}" class="footer-additional-text">
						{{ footer_aditional_info_content_2 }}
					</a>


					<span class="footer-additional-separator">&nbsp;&nbsp;</span>
					<span class="footer-additional-label">{{ footer_aditional_info_title_3 }}</span>
					<span class="footer-additional-separator">
						|
					</span>

					<a href="tel:{{ footer_aditional_info_content_3}}" class="footer-additional-text">
						{{ footer_aditional_info_content_3 }}
					</a>


				</div>
			{% endif %}
		</div>
	</div>


	{# Language selector #}
	{% if languages | length > 1 and settings.languages_footer and template != 'password' %}
		<div class="row mb-5">
			<div class="col-6 offset-3 col-md-2 offset-md-5">
				{% include "snipplets/navigation/navigation-lang.tpl" %}
			</div>
		</div>
	{% endif %}
</div>

<div class="js-footer-legal footer-legal">
	<div class="container-fluid mt-4">
		<div class="row">
			<div
				class="col-12 text-start text-md-center">

				{# 1) Desarrollado y Acelerado por WE-ARE #}
				<a href="https://we-are.com.ar/" target="_blank" rel="nofollow" class="custom-powered-by d-inline-flex align-items-center justify-content-center mb-2">
					<span class="mr-3">DESARROLLADO Y ACELERADO POR</span>
					{% include "snipplets/svg/we-are.tpl" with { svg_custom_class: "icon-inline icon-lg icon-we" } %}
				</a>

				{# 2) Creado con Tiendanube (centrado) #}
				<div class="mb-2">
					{{ new_powered_by_link }}
				</div>

				{# 3) Copyright (centrado) + links legales #}
				<div class="mb-1 copy-footer-info">
					{{ "Copyright {1} - {2}. Todos los derechos reservados." 
            | translate( (store.business_name ? store.business_name : store.name) ~ (store.business_id ? ' - ' ~ store.business_id : ''), "now" | date('Y') ) }}


					{{ component('claim-info', {
            container_classes: "",
            divider_classes: "",
            text_classes: { text_consumer_defense: '' },
            link_classes: {
              link_consumer_defense: "font-weight-bold text-underline",
              link_order_cancellation: "font-weight-bold text-underline",
            }
        }) }}
				</div>
			</div>
		</div>
	</div>
</div></div></footer>
