{% set section_id = section_id | default(false) %}
{% set section_title = section_title | default(false) %}

{% set product_list_01 = (list_01 != 'none' ? attribute(sections, list_01) : false) | default(false) %}
{% set product_list_02 = (list_02 != 'none' ? attribute(sections, list_02) : false) | default(false) %}
{% set product_list_03 = (list_03 != 'none' ? attribute(sections, list_03) : false) | default(false) %}

{% set lists_array = [product_list_01, product_list_02, product_list_03] %}
{% set button_array = [
		product_list_01 and button_01 ? { 'text': button_01, 'key': product_list_01.id } : false, 
		product_list_02 and button_02 ? { 'text': button_02, 'key': product_list_02.id } : false, 
		product_list_03 and button_03 ? { 'text': button_03, 'key': product_list_03.id } : false
	] %}


{% if section_id %}
	<section class="section-home section-{{section_id}}-home product-slider-with-nav" data-store="product-slider-with-nav">
		<div class="container-fluid">
			<div class="row mx-0 justify-content-between">
				{% if section_title %}
					<div class="col-auto text-left">
						<h3 class="h6 h1-md">{{ section_title|upper }}</h3>
					</div>
				{% endif %}
				<div class="col-auto">
					{% set first_available_list = true %}
					{% for button in button_array %}
						{% if button %}
							<a class="js-swiper-nav-button swiper-nav-button ml-4 ml-md-2{% if first_available_list %} active{% endif %}" data-nav-list-key="{{button.key}}">{{button.text}}</a>
							{% set first_available_list = false %}
						{% endif %}
					{% endfor %}
				</div>
			</div>
			<div class="row mx-0">
				<div class="col-12 px-4">
					<div class="js-swiper-{{section_id}} swiper-container">
						<div class="swiper-wrapper">
							{% for product in lists_array.0.products %}
								{% include 'snipplets/grid/item.tpl' with {'slide_item': true} %}
							{% endfor %}
						</div>
					</div>
					<div class="js-swiper-{{section_id}}-pagination swiper-pagination"></div>
					<div class="js-swiper-{{section_id}}-prev swiper-button-prev d-block">{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-w-8 svg-icon-text"} %}</div>
					<div class="js-swiper-{{section_id}}-next swiper-button-next d-block">{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-w-8 svg-icon-text"} %}</div>
				</div>
			</div>
		</div>

		{% for list in lists_array %}
			{% if list %}
				<div class="product-slider-with-nav-collection" data-nav-list-key-for="{{list.id}}" style="display:none">
					{% for product in list.products %}
						{% include 'snipplets/grid/item.tpl' with {'slide_item': true} %}
					{% endfor %}
				</div>
			{% endif %}
		{% endfor %}
	</section>
{% endif %}
