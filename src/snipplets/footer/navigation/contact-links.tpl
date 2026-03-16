{# /*============================================================================
  #Contact links
==============================================================================*/#}

{% set footer_svg_cols = footer ? 'col-auto px-0 icon-inline icon-lg icon-w mr-2 svg-icon-text':'icon-inline icon-lg icon-w mx-2 svg-icon-accent' %}
{% set footer_item_cols = footer ? 'col-10 px-0':'' %}

<ul
	class="contact-info {% if columns %}row mx-0{% endif %}">
	{# {% if store.email %}
			<li class="contact-item{% if columns %} col-6 col-md {% elseif footer %} col-12 row mx-0 px-md-0{% endif %}">
					{% include "snipplets/svg/envelope.tpl" with {svg_custom_class: footer_svg_cols} %}
				<a href="mailto:{{ store.email }}" class="contact-link {{footer_item_cols}}">{{ store.email }}</a>
			</li>
		{% endif %} #}
	{% if store.phone %}
		<li class="contact-item{% if columns %} col-6 col-md {% elseif footer %} col-12 row mx-0 px-md-0{% endif %}">
			{% include "snipplets/svg/phone.tpl" with {svg_custom_class: footer_svg_cols} %}
			<a href="tel:{{ store.phone }}" class="contact-link {{footer_item_cols}}">{{ store.phone }}</a>
		</li>
	{% endif %}
	{% if store.whatsapp %}
		{% set formatted_phone_whatsapp = false %}
		{% set phone_whatsapp = false %}
		{% set formatted_phone_additional = false %}
		{% set phone_additioal = false %}

		{% set phone = store.whatsapp | trim('https://wa.me/') %}
		{% set area_code = phone[3:2] %}
		{% set number_part1 = phone[5:4] %}
		{% set number_part2 = phone[8:4] %}
		{% set formatted_phone_whatsapp = '+54 9 ' ~ area_code ~ ' ' ~ number_part1 ~ '-' ~ number_part2 %}
		{% set phone_whatsapp = phone %}
		<li class="contact-item{% if columns %} col-6 col-md {% elseif footer %} col-12 row mx-0 px-md-0{% endif %}">
			{% include "snipplets/svg/whatsapp.tpl" with {svg_custom_class: footer_svg_cols} %}
			<a href="{{ store.whatsapp }}" target="_blank" class="contact-link {{item_cols}}">{{ formatted_phone_whatsapp }}</a>
		</li>
	{% endif %}
	{% if settings.footer_contact_branches_text and settings.footer_contact_branches_url %}
		<li class="contact-item{% if columns %} col-6 col-md {% elseif footer %} col-12 row mx-0 px-md-0{% endif %}">
			{% include "snipplets/svg/form.tpl" with {svg_custom_class: footer_svg_cols} %}
			<a target="_blank" href="{{ settings.footer_contact_branches_url }}" class="contact-link {{footer_item_cols}}">{{ settings.footer_contact_branches_text }}</a>
		</li>
	{% endif %}
	{% if settings.footer_contact_form_text and settings.footer_contact_form_url %}
		<li class="contact-item{% if columns %} col-6 col-md {% elseif footer %} col-12 row mx-0 px-md-0{% endif %}">
			{% include "snipplets/svg/briefcase.tpl" with {svg_custom_class: footer_svg_cols} %}
			<a target="_blank" href="{{ settings.footer_contact_form_url }}" class="contact-link {{footer_item_cols}}">{{ settings.footer_contact_form_text }}</a>
		</li>
	{% endif %}
	{# {% if not phone_and_mail_only and store.address and not is_order_cancellation %}
			<li class="contact-item{% if columns %} col-6 col-md {% elseif footer %} col-12 row mx-0 px-md-0{% endif %}">
					{% include "snipplets/svg/map-marker-alt.tpl" with {svg_custom_class: footer_svg_cols} %}
				<span class="{{ footer_item_cols }}">{{ store.address }}</span>
			</li>
		{% endif %} #}
	{% if store.contact_intro %}
		<li class="contact-item{% if columns %} col-6 col-md {% elseif footer %} col-12 row mx-0 px-md-0{% endif %}">
			{% include "snipplets/svg/clock.tpl" with {svg_custom_class: footer_svg_cols} %}
			<span class="contact-link col-auto px-0">{{ store.contact_intro|raw }}</span>
		</li>
	{% endif %}
</ul>
