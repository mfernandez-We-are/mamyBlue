{# /*============================================================================
  #Contact information
==============================================================================*/#}

{% set svg_cols = 'col-2 col-md-auto px-0 icon-inline icon-lg icon-w mx-0 mx-md-2 svg-icon-accent' %}
{% set item_cols = 'col-10 px-0' %}

{% set contact_title = contact_title | default(false) %}
{% set location_title = location_title | default(false) %}

<div class="row mx-0 justify-content-around">
	<div class="px-0 col-4 col-md-12">
		<h3 class="contact-info-title text-center text-md-left h3">{{contact_title}}</h3>
		<ul class="contact-info">
			{% if store.phone %}
				<li class="contact-item col-12 row px-0 mx-0">
					{% include "snipplets/svg/phone.tpl" with {svg_custom_class: svg_cols} %}
					<a href="tel:{{ store.phone }}" target="_blank" class="contact-link {{item_cols}}">Llamanos al
						<br>
						{{ store.phone }}</a>
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
				<li class="contact-item col-12 row px-0 mx-0">
					{% include "snipplets/svg/whatsapp.tpl" with {svg_custom_class: svg_cols} %}
					<a href="{{ store.whatsapp }}" target="_blank" class="contact-link {{item_cols}}">Mandanos un mensaje
						<br>
						{{ formatted_phone_whatsapp }}</a>
				</li>
			{% endif %}
		</ul>
	</div>

	<div class="px-0 col-6 col-md-12">
		<h3 class="contact-info-title h3 text-center text-md-left">{{location_title}}</h3>
		<ul class="contact-info">
			{% if store.address and not is_order_cancellation %}
				<li class="contact-item col-12 row px-0 mx-0">
					{% include "snipplets/svg/map-marker-alt.tpl" with {svg_custom_class: svg_cols} %}
					<span class="{{ item_cols }}">{{ store.address }}</span>
				</li>
			{% endif %}
			{% if store.contact_intro %}
				<li class="contact-item col-12 row px-0 mx-0">
					{% include "snipplets/svg/clock.tpl" with {svg_custom_class: svg_cols} %}
					<span class="contact-link {{item_cols}}">{{ store.contact_intro|raw }}</span>
				</li>
			{% endif %}
		</ul>
	</div>
</div>
