{# Custom whatsap #}
{% set formatted_phone_whatsapp = false %}
{% set phone_whatsapp = false %}
{% set formatted_phone_additional = false %}
{% set phone_additioal = false %}
{% set whatsapp_numbers = [] %}

{% if settings.custom_whatsapp %}

	{% for i in 1..3 %}
		{% set wpp_text = attribute(settings, "whatsapp_#{i}_text") %}
		{% set wpp_number = attribute(settings, "whatsapp_#{i}_number") %}


		{% set phone = wpp_number %}
		{% set area_code = phone[3:2] %}
		{% set number_part1 = phone[5:4] %}
		{% set number_part2 = phone[8:4] %}
		{% set wpp_formated = '+54 9 ' ~ area_code ~ ' ' ~ number_part1 ~ '-' ~ number_part2 %}

		{% set wpp = { 'name': wpp_text ,'number': wpp_number, 'formatted': wpp_formated } %}

		{% set whatsapp_numbers = whatsapp_numbers|merge([wpp]) %}
	{% endfor %}

	<div class="whatsapp-float">
		<div class="whatsapp-button">
			{% include "snipplets/svg/whatsapp.tpl" with {svg_custom_class: "icon-inline icon-2x icon-wsp"} %}
		</div>
		<div class="whatsapp-numbers">
			{% for data in whatsapp_numbers %}
				<a href="https://wa.me/{{ data.number }}" target="_blank">{{ data.name }}<br>{{ data.formatted }}</a>
			{% endfor %}
		</div>
	</div>

	{# Custom Styles - Whatsapp Multiple  #}
	<style>
		.whatsapp-float {
			position: fixed;
			bottom: 15px;
			right: 15px;
			z-index: 1000;
		}

		.whatsapp-button {
			background-color: #25d366;
			border-radius: 50%;
			width: 45px;
			height: 45px;
			display: flex;
			align-items: center;
			justify-content: center;
			cursor: pointer;
			box-shadow: 2px 2px 6px rgba(0, 0, 0, 0.4);
		}

		.whatsapp-button svg {
			fill: white;
		}

		.whatsapp-numbers {
			position: absolute;
			bottom: 70px;
			right: 0;
			background: white;
			border-radius: 10px;
			padding: 10px;
			box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
			opacity: 0;
			visibility: hidden;
			min-width: 200px;
			transition: all 0.3s ease;
			transform: translateY(10px);
		}

		.whatsapp-float:hover .whatsapp-numbers {
			opacity: 1;
			visibility: visible;
			transform: translateY(0);
		}

		.whatsapp-numbers a {
			display: block;
			padding: 10px;
			color: #075e54;
			text-decoration: none;
			font-weight: bold;
			transition: background 0.3s;
		}

		.whatsapp-numbers a:hover {
			background: #f0f0f0;
		}
	</style>

{% elseif not settings.custom_whatsapp and store.whatsapp %}

	{# {% if store.whatsapp %}
		<a href="{{ store.whatsapp }}" target="_blank" class="js-btn-fixed-bottom btn-whatsapp" aria-label="{{ 'Comunicate por WhatsApp' | translate }}">
			{% include "snipplets/svg/whatsapp.tpl" with {svg_custom_class: "icon-inline icon-2x"} %}
		</a>
	{% endif %} #}

{% endif %}
